import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final User user = FirebaseAuth.instance.currentUser!;

  // Text Editing Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  // Loading state
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  // Fetch user data from Firebase Auth & Firestore
  void fetchUserData() async {
    nameController.text = user.displayName ?? '';
    phoneController.text = user.phoneNumber ?? '';

    var doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    if (doc.exists) {
      usernameController.text = doc.data()?['username'] ?? '';
    }
  }

  // Function to update profile in Firebase
  Future<void> updateProfile() async {
    try {
      isLoading.value = true;

      // Update Firebase Authentication profile
      await user.updateDisplayName(nameController.text);
      await user.reload(); // Refresh user data

      // Update Firestore
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'username': usernameController.text,
        'phone': phoneController.text,
      }, SetOptions(merge: true));

      Get.snackbar("Success", "Profile updated successfully!",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);

      // Return true to notify the UI
      Get.back(result: true);
    } catch (e) {
      Get.snackbar("Error", "Failed to update profile: $e",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    super.onClose();
  }
}
