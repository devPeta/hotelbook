import 'package:bookhotel/core/common/appfullscreenloader.dart';
import 'package:bookhotel/core/common/appsnackbarloaders.dart';
import 'package:bookhotel/presentation/views/app_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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

  /// Google Sign-In function
  Future<void> googleSignIn() async {
    AppFullScreenLoader.openLoadingDialog('Signing in with Google...');

    try {
      // Step 1: Trigger the Google Sign-In flow
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        AppFullScreenLoader.stopLoading();
        AppLoaders.warningSnackBar(title: 'Sign-in cancelled');
        return; // User canceled the sign-in
      }

      // Step 2: Obtain the authentication details from the Google user
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Step 3: Create a new credential to sign in with Firebase
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Step 4: Sign in to Firebase with the Google credentials
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      AppFullScreenLoader.stopLoading();

      AppLoaders.successSnackBar(title: 'Successfully signed in');
      Get.off(() => const AppNavigator()); // Navigate after successful login
    } on FirebaseAuthException catch (e) {
      AppFullScreenLoader.stopLoading();

      AppLoaders.errorSnackBar(title: 'Google Sign-In failed: ${e.message}');
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: 'An error occurred');
    }
  }

  /// Facebook Sign-In function
  Future<void> facebookSignIn() async {
  //   AppFullScreenLoader.openLoadingDialog('Signing in with Facebook...');
  //
  //   try {
  //     // Step 1: Trigger the Facebook login flow
  //     final result = await FacebookAuth.instance.login();
  //
  //     if (result.status != LoginStatus.success) {
  //       AppFullScreenLoader.stopLoading();
  //       AppLoaders.warningSnackBar(title: 'Facebook login failed');
  //       return; // Login failed
  //     }
  //
  //     // Step 2: Create a Facebook credential for Firebase
  //     final OAuthCredential facebookCredential = FacebookAuthProvider.credential(result.accessToken!);
  //
  //     // Step 3: Sign in with Firebase using the Facebook credentials
  //     UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookCredential);
  //
  //     AppFullScreenLoader.stopLoading();
  //     AppLoaders.successSnackBar(title: 'Successfully signed in with Facebook');
  //     Get.off(() => const AppNavigator()); // Navigate after successful login
  //   } on FirebaseAuthException catch (e) {
  //     AppFullScreenLoader.stopLoading();
  //     AppLoaders.errorSnackBar(title: 'Facebook Sign-In failed: ${e.message}');
  //   } catch (e) {
  //     AppFullScreenLoader.stopLoading();
  //     AppLoaders.errorSnackBar(title: 'An error occurred');
  //   }
  }
}