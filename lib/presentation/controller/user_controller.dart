// import 'package:bookhotel/core/common/appsnackbarloaders.dart';
// import 'package:bookhotel/data/users/user_model.dart';
// import 'package:bookhotel/data/users/user_respository.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class UserController extends GetxController {
//   static UserController get instance => Get.find();
//
//   final userRepository = Get.put(UserRepository());
//   Rx<UserModel> user = UserModel.empty().obs;
//   final profileLoading = false.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserRecord();
//   }
//
//   ///Fetch User Data
//   Future<void> fetchUserRecord() async {
//     try{
//       profileLoading.value = true;
//       final user = await userRepository.fetchUserDetails();
//       this.user(user);
//     } catch (e) {
//       user(UserModel.empty());
//     } finally {
//       profileLoading.value = false;
//     }
//   }
//
//   ///Save User Record From any Registration Provider
//   Future<void> saveUserRecord(UserCredential? userCredentials) async {
//     try{
//       if(userCredentials != null){
//
//         //Convert Name to First And Last Name
//         final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
//         final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');
//
//         //Map Data
//         final user = UserModel(
//           firstName: nameParts[0],
//           lastName: nameParts.length > 1 ? nameParts.sublist(1).join("") : '',
//           username: username,
//           email: userCredentials.user!.email ?? '',
//           profilePicture: userCredentials.user!.photoURL ?? '',
//           id: userCredentials.user!.uid,
//           phoneNumber: userCredentials.user!.phoneNumber ?? '',
//         );
//
//         //Save User data
//         await userRepository.saveUserRecord(user);
//       }
//     }
//     catch(e){
//       AppLoaders.warningSnackBar(
//         title: 'Data not saved ',
//         message: 'Something went wrong while saving your information. You can re save your data in your profile.',
//       );
//     }
//   }
// }
//
