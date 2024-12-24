import 'package:bookhotel/core/common/appfullscreenloader.dart';
import 'package:bookhotel/core/exeception/firebase_exceptions.dart';
import 'package:bookhotel/core/exeception/format_exceptions.dart';
import 'package:bookhotel/core/exeception/platform_exceptions.dart';
import 'package:bookhotel/data/authentication/authentication_respository.dart';
import 'package:bookhotel/data/users/user_model.dart';
import 'package:bookhotel/presentation/views/auths/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  ///To delete user account we have to re authenticate user
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  ///Function to Save user data to FireStore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e){
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (e){
      throw const TFormatExceptions();
    } on PlatformException catch(e){
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

  ///Function to Fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e){
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (e){
      throw const TFormatExceptions();
    } on PlatformException catch(e){
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

  ///update any field in specific users collection
  Future<void> updateUserData(UserModel updateUser) async {
    try {
      await _db.collection('Users').doc(updateUser.id).set(updateUser.toJson());
    } on FirebaseException catch (e){
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (e){
      throw const TFormatExceptions();
    } on PlatformException catch(e){
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

  ///update a Single Field
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e){
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (e){
      throw const TFormatExceptions();
    } on PlatformException catch(e){
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

  ///Removed  User From FireStore
  Future<void> removeUserRecord(String userID) async {
    try {
      await _db.collection('Users').doc(userID).delete();
    } on FirebaseException catch (e){
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (e){
      throw const TFormatExceptions();
    } on PlatformException catch(e){
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

  ///Delete Account Warning
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(4),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete your account permanently? This action is not reversible ',
        confirm: ElevatedButton(
          onPressed:() {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)
          ),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: ()=> Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')
        )
    );
  }

  ///Delete User Account
  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog('Processing',);

      ///First Wait for authentication
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e)=> e.providerId).first;
      if (provider.isNotEmpty){
        //Re verify using Auth Email
        if (provider == 'google.com'){
          await auth.signInWithGoogle();
          //await auth.deleteAccount();
          Get.offAll(()=> const LoginScreen());
        } else if (provider == 'password'){
          FullScreenLoader.stopLoading();
          //Get.to(()=> const ReAuthLoginForm());
        }
      }
    }
    catch (e) {
      FullScreenLoader.stopLoading();
      throw 'Something went wrong. please try again';
    }
  }

  ///Re Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {

  }

}