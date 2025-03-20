import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  final User user = FirebaseAuth.instance.currentUser!;
  final ImagePicker _picker = ImagePicker();
  var imageFile = Rx<File?>(null);
  var imageUrl = RxString(""); // Stores profile picture URL

  late Database _database;

  @override
  void onInit() {
    super.onInit();
    _initDatabase(); // Initialize local database
    fetchProfileImage();
  }

  // Initialize Database
  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'profile.db'),
      onCreate: (db, version) {
        return db.execute("CREATE TABLE profile (id TEXT PRIMARY KEY, imageUrl TEXT)");
      },
      version: 1,
    );
  }

  // Fetch Profile Image from Firestore or Local DB
  Future<void> fetchProfileImage() async {
    try {
      // Check Local Storage First
      List<Map<String, dynamic>> result = await _database.query('profile', where: "id = ?", whereArgs: [user.uid]);

      if (result.isNotEmpty) {
        imageUrl.value = result.first['imageUrl'];
      } else {
        // Fetch from Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (userDoc.exists && userDoc['profileImage'] != null) {
          imageUrl.value = userDoc['profileImage'];
          _saveImageLocally(userDoc['profileImage']); // Save to Local Storage
        }
      }
    } catch (e) {
      print("Error fetching profile image: $e");
    }
  }

  // Pick Image from Gallery
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
      await uploadImage(); // Upload after picking
    }
  }

  // Upload Image to Firebase Storage
  Future<void> uploadImage() async {
    if (imageFile.value == null) return;

    try {
      final ref = FirebaseStorage.instance.ref().child('profile_images/${user.uid}.jpg');
      await ref.putFile(imageFile.value!);

      String downloadUrl = await ref.getDownloadURL();
      imageUrl.value = downloadUrl;

      // Store URL in Firestore
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'profileImage': downloadUrl,
      }, SetOptions(merge: true));

      // Save to Local Storage
      _saveImageLocally(downloadUrl);

      // Update Firebase Auth Profile
      await user.updatePhotoURL(downloadUrl);
      await user.reload();
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  // Save Profile Image to Local Database
  Future<void> _saveImageLocally(String imageUrl) async {
    await _database.insert(
      'profile',
      {'id': user.uid, 'imageUrl': imageUrl},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Logout Function
  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login'); // Redirect to login screen
  }
}
