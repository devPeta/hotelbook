import 'package:bookhotel/core/common/appfullscreenloader.dart';
import 'package:bookhotel/core/common/appnetworkmanager.dart';
import 'package:bookhotel/core/common/appsnackbarloaders.dart';
import 'package:bookhotel/data/authentication/authentication_respository.dart';
import 'package:bookhotel/data/users/user_model.dart';
import 'package:bookhotel/data/users/user_respository.dart';
import 'package:bookhotel/presentation/views/auths/verification/verify_email_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final signupFormKey = GlobalKey<FormState>();

  /// Sign Up Method
  Future<void> signup() async {
    FullScreenLoader.openLoadingDialog('Processing your information...');
    try {
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        throw Exception('No internet connection. Please check your network.');
      }

      // Validate Form
      if (!signupFormKey.currentState!.validate()) {
        throw Exception('Invalid form input. Please correct errors and try again.');
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        throw Exception('You must accept the privacy policy to create an account.');
      }

      // Register User with Firebase Authentication
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Save User Data to Firebase
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      // Save User Record in Repository
      final userRepository = Get.find<UserRepository>();
      await userRepository.saveUserRecord(newUser);

      // Show Success Message
      AppLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Please verify your email.',
      );

      // Navigate to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Show Error Message
      AppLoaders.errorSnackBar(
        title: 'Signup Failed',
        message: 'An error occurred while signing up.'

      );
    } finally {
      // Stop Loader
      FullScreenLoader.stopLoading();
    }
  }
}
