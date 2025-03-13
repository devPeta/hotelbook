import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileController extends GetxController {
  final User user = FirebaseAuth.instance.currentUser!;
  final ImagePicker _picker = ImagePicker();
  var imageFile = Rx<File?>(null);
  var imageUrl = RxString(""); // Stores profile picture URL

  @override
  void onInit() {
    super.onInit();
    fetchProfileImage(); // Fetch profile picture on init
  }

  // Fetch Profile Image from Firestore
  Future<void> fetchProfileImage() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (userDoc.exists && userDoc['profileImage'] != null) {
        imageUrl.value = userDoc['profileImage']; // Set profile image
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
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'profileImage': downloadUrl,
      });

      // Update Firebase Auth Profile
      await user.updatePhotoURL(downloadUrl);
      await user.reload();
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  // Logout Function
  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login'); // Redirect to login screen
  }
}
