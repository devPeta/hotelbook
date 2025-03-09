import 'package:bookhotel/admin/admin_booking.dart';
import 'package:bookhotel/core/common/appsnackbarloaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminSignInController extends GetxController {
  static AdminSignInController get instance => Get.find();

  /// Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// Observables
  final hidePassword = true.obs;

  /// Firebase Instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Admin Login Function
  Future<void> loginAdmin() async {
    try {
      // Show loading snackbar
      AppLoaders.successSnackBar(
          title: 'Verifying',
          message: 'Logging in...',
        );

      // Authenticate with Firebase
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      String uid = userCredential.user!.uid;

      // Check if user exists in Firestore's "admins" collection
      DocumentSnapshot adminDoc = await _firestore.collection('admins').doc(uid).get();

      if (adminDoc.exists) {
        // Fetch admin data
        String role = adminDoc['role'];
        String email = adminDoc['email'];

        // Show success message
          AppLoaders.successSnackBar(
          title: 'Successful',
          message: 'Welcome back Admin',
        );

        // Navigate to Admin Dashboard
        Get.offAll(() => AdminBooking());
      } else {


        // User is not an admin
        AppLoaders.successSnackBar(
          title: 'Access Denied!',
          message: 'User not an admin',
        );

      }
    } catch (e) {
      AppLoaders.successSnackBar(
          title: 'Unsuccessful',
          message: 'Login failed: ${e.toString()}',
        );

    }
  }
}
