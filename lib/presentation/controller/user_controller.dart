import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var fullName = "".obs;
  var address = "".obs;
  var idNumber = "".obs;
  var email = "".obs;
  var phoneNumber = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  /// ✅ Fetch or Create User Data in Firestore
  Future<void> fetchUserData() async {
    try {
      String uid = auth.currentUser?.uid ?? "";

      if (uid.isEmpty) {
        print("User is not logged in.");
        return;
      }

      DocumentReference userRef = firestore.collection('users').doc(uid);
      DocumentSnapshot userDoc = await userRef.get();

      if (userDoc.exists) {
        // 🔹 User already exists, load data
        fullName.value = "${userDoc['firstName']} ${userDoc['lastName']}";
        address.value = userDoc['address'] ?? 'Not Set';
        idNumber.value = userDoc['idNumber'] ?? 'Not Set';
        email.value = userDoc['email'];
        phoneNumber.value = userDoc['phoneNumber'] ?? 'Not Set';
      } else {
        // 🔹 User does not exist, create new user
        print("User not found in Firestore, creating a new document...");
        await userRef.set({
          "firstName": "New",
          "lastName": "User",
          "email": auth.currentUser?.email ?? "",
          "address": "",
          "idNumber": "",
          "phoneNumber": auth.currentUser?.phoneNumber ?? "",
          "createdAt": FieldValue.serverTimestamp(),
        });

        // 🔹 Reload Data After Creation
        fetchUserData();
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }
}
