import 'package:bookhotel/core/common/appfullscreenloader.dart';
import 'package:bookhotel/core/common/appnetworkmanager.dart';
import 'package:bookhotel/core/common/appsnackbarloaders.dart';
import 'package:bookhotel/data/authentication/authentication_respository.dart';
import 'package:bookhotel/presentation/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class LogInController extends GetxController {
  static LogInController get instance => Get.find();

  /// Variables
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final logInFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
  }

  /// Email and Password Sign-In
  Future<void> emailAndPasswordSignIn() async {
    FullScreenLoader.openLoadingDialog('Logging you in...');
    try {
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) throw Exception('No internet connection');

      // Validate Form
      if (!logInFormKey.currentState!.validate()) throw Exception('Invalid form input');

      // Save Credentials if Remember Me is Checked
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Firebase Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Redirect After Login
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AppLoaders.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    } finally {
      FullScreenLoader.stopLoading();
    }
  }

  /// Google Sign-In
  Future<void> googleSignIn() async {
    FullScreenLoader.openLoadingDialog('Logging you in...');
    try {
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) throw Exception('No internet connection');

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await Get.find<UserController>().saveUserRecord(userCredentials);

      // Redirect After Login
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AppLoaders.errorSnackBar(
        title: 'Google Sign-In Failed',
        message: e.toString(),
      );
    } finally {
      FullScreenLoader.stopLoading();
    }
  }
}
