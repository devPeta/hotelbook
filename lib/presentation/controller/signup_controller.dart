import 'package:bookhotel/core/common/appfullscreenloader.dart';
import 'package:bookhotel/core/common/appsnackbarloaders.dart';
import 'package:bookhotel/presentation/views/app_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Text Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  /// Observables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  /// Form Key
  final signupFormKey = GlobalKey<FormState>();

  /// ✅ New Registration Function (With Firestore)
  Future<void> registerUser() async {
    if (!signupFormKey.currentState!.validate()) {
      final firstName = firstNameController.text.trim();
      final lastName = lastNameController.text.trim();
      final username = userNameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final phoneNumber = phoneNumberController.text.trim();
      if ([firstName, lastName, username, email, password, phoneNumber]
          .any((element) => element.isEmpty)) {
        AppLoaders.warningSnackBar(title: 'All fields are required');

        AppFullScreenLoader.openLoadingDialog('Processing your information...');

        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);

          AppFullScreenLoader.openLoadingDialog(
              'Processing your information...');

          /// 👉 Create user in Firebase Authentication
          String uid = userCredential.user!.uid;

          /// 👉 Store user data in Firestore
          await FirebaseFirestore.instance.collection('users').doc(uid).set({
            "firstName": "",
            "lastName": "",
            "email": email,
            "address": "",
            "idNumber": "",
            "phoneNumber": "",
            "createdAt": FieldValue.serverTimestamp(),
          });

          /// ✅ Success Message & Navigation
          AppLoaders.successSnackBar(
            title: 'Registered Successfully',
            message: 'Your account has been created! Please verify your email.',
          );

          Get.off(() => AppNavigator());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            AppLoaders.warningSnackBar(title: 'Password is too weak');
          } else if (e.code == 'email-already-in-use') {
            AppLoaders.warningSnackBar(title: 'Account already exists');
          } else {
            AppLoaders.errorSnackBar(
                title: 'Registration failed: ${e.message}');
          }
        } finally {
          AppFullScreenLoader.stopLoading();
        }
      }
    }
  }


// import 'package:bookhotel/core/common/appfullscreenloader.dart';
// import 'package:bookhotel/core/common/appsnackbarloaders.dart';
// import 'package:bookhotel/presentation/views/app_navigator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// class SignupController extends GetxController {
//   static SignupController get instance => Get.find();
//
//   /// Text Controllers
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final userNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final phoneNumberController = TextEditingController();
//
//   /// Observables
//   final hidePassword = true.obs;
//   final privacyPolicy = true.obs;
//
//   /// Form Key
//   final signupFormKey = GlobalKey<FormState>();
//
//   /// ✅ Registration Function
//   Future<void> registerUser() async {
//     if (signupFormKey.currentState!.validate()) {
//       final firstName = firstNameController.text.trim();
//       final lastName = lastNameController.text.trim();
//       final username = userNameController.text.trim();
//       final email = emailController.text.trim();
//       final password = passwordController.text.trim();
//       final phoneNumber = phoneNumberController.text.trim();
//
//       if ([firstName, lastName, username, email, password, phoneNumber]
//           .any((element) => element.isEmpty)) {
//         AppLoaders.warningSnackBar(title: 'All fields are required');
//         return;
//       }
//
//       AppFullScreenLoader.openLoadingDialog('Processing your information...');
//
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: email, password: password);
//         AppLoaders.successSnackBar(
//           title: 'Registered Successfully',
//           message: 'Your account has been created! Please verify your email.',
//         );
//
//         Get.off(() => AppNavigator());
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           AppLoaders.warningSnackBar(title: 'Password provided is too weak');
//         } else if (e.code == 'email-already-in-use') {
//           AppLoaders.warningSnackBar(title: 'Account already exists');
//         } else {
//           AppLoaders.errorSnackBar(title: 'Registration failed: ${e.message}');
//         }
//       } finally {
//         AppFullScreenLoader.stopLoading();
//       }
//     }
//   }
// }
}