import 'package:bookhotel/core/common/appfullscreenloader.dart';
import 'package:bookhotel/core/common/appsnackbarloaders.dart';
import 'package:bookhotel/presentation/views/app_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  /// Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// Observables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final rememberMe = true.obs;

  /// Form Key
  final logInFormKey = GlobalKey<FormState>();

  /// ✅ Login Function
  Future<void> loginUser() async {
    if (logInFormKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if ([email, password].any((element) => element.isEmpty)) {
        AppLoaders.warningSnackBar(title: 'All fields are required');
        return;
      }

      AppFullScreenLoader.openLoadingDialog('Processing your information...');

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        AppFullScreenLoader.stopLoading(); // Stop loading before navigation

        AppLoaders.successSnackBar(
          title: 'Successful',
          message: 'Welcome back',
        );

        Get.off(() => const AppNavigator()); // Navigate after stopping the loader
      } on FirebaseAuthException catch (e) {
        AppFullScreenLoader.stopLoading(); // Ensure the loader stops on error

        if (e.code == 'weak-password') {
          AppLoaders.warningSnackBar(title: 'Password provided is too weak');
        } else if (e.code == 'email-already-in-use') {
          AppLoaders.warningSnackBar(title: 'Account already exists');
        } else {
          AppLoaders.errorSnackBar(title: 'Login failed: ${e.message}');
        }
      }
    }
  }
}