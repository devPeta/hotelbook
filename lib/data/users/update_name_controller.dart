// import 'package:bookhotel/core/common/appfullscreenloader.dart';
// import 'package:bookhotel/core/common/appnetworkmanager.dart';
// import 'package:bookhotel/core/common/appsnackbarloaders.dart';
// import 'package:bookhotel/data/users/user_respository.dart';
// import 'package:bookhotel/presentation/controller/user_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
//
// class UpdateNameController extends GetxController{
//   static UpdateNameController get instance => Get.find();
//
//   final firstName = TextEditingController();
//   final lastName = TextEditingController();
//   final userRepository = Get.put(UserRepository());
//   GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();
//
//   ///Init user Data when Home Screen Appears
//   @override
//   void onInit(){
//     initializeNames();
//     super.onInit();
//   }
//
//   final userController = UserController.instance;
//   //update the Rx User Value
//   //userController.user.value.firstName = firstName.text.trim();
//   //userController.user.value.lastName = lastName.text.trim();
//
//   ///Fetch user record
//   Future<void> initializeNames() async {
//     firstName.text = userController.user.value.firstName;
//     lastName.text = userController.user.value.lastName;
//   }
//
//
//   /// Function to update Name
//   Future<void> updateUserName() async {
//     try{
//       //Start Loading
//       FullScreenLoader.openLoadingDialog('We are processing your information...');
//
//       //Check Internet Connectivity
//       final isConnected = await NetworkManager.instance.isConnected();
//       if(isConnected){
//         FullScreenLoader.stopLoading();
//         return;
//       }
//
//       //Form Validator
//       if(!updateUserNameFormKey.currentState!.validate()){
//         FullScreenLoader.stopLoading();
//         return;
//       }
//
//
//       //Update user's first And Last Name in the Firebase Firestore
//       Map<String, dynamic> name = {'FirstName': firstName.text.trim(),
//         'LastName': lastName.text.trim(),
//       };
//       ///await UserRepository.updateSingleField(name);
//
//
//       //Remove Loader
//       FullScreenLoader.stopLoading();
//
//       //Show Success Message
//       AppLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated.',);
//
//       //Move to previous screen
//       //Get.off(()=> const ProfileScreen());
//     } catch (e) {
//       FullScreenLoader.stopLoading();
//       AppLoaders.errorSnackBar(title: 'oh Snap', message: e.toString());
//     }
//   }
// }