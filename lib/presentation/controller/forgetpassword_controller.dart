import 'package:bookhotel/core/common/appfullscreenloader.dart';
import 'package:bookhotel/core/common/appsnackbarloaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  /// Text Controller
  final emailController = TextEditingController();

  /// Form Key
  final forgetPasswordFormKey = GlobalKey<FormState>();

  /// ✅ Send Password Reset Email
  Future<void> sendPasswordResetEmail() async {
    if (forgetPasswordFormKey.currentState!.validate()) {
      final email = emailController.text.trim();

      if (email.isEmpty) {
        AppLoaders.warningSnackBar(title: 'Email is required');
        return;
      }

      AppFullScreenLoader.openLoadingDialog('Sending password reset email...');

      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

        AppFullScreenLoader.stopLoading(); // Stop loading before showing success message

        AppLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'A password reset link has been sent to your email.',
        );

        Get.back(); // Navigate back to the previous screen
      } on FirebaseAuthException catch (e) {
        AppFullScreenLoader.stopLoading(); // Ensure the loader stops on error

        if (e.code == 'user-not-found') {
          AppLoaders.warningSnackBar(title: 'No user found with this email');
        } else {
          AppLoaders.errorSnackBar(title: 'Failed to send reset email: ${e.message}');
        }
      }
    }
  }
}
