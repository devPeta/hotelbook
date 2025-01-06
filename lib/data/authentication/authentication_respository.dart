import 'package:bookhotel/core/exeception/firebase_auth_exceptions.dart';
import 'package:bookhotel/core/exeception/firebase_exceptions.dart';
import 'package:bookhotel/core/exeception/format_exceptions.dart';
import 'package:bookhotel/core/exeception/platform_exceptions.dart';
import 'package:bookhotel/presentation/views/app_navigator.dart';
import 'package:bookhotel/presentation/views/auths/login/login_screen.dart';
import 'package:bookhotel/presentation/views/auths/onboarding/onboarding_screen.dart';
import 'package:bookhotel/presentation/views/auths/verification/verify_email_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

      ///Variables
      final deviceStorage = GetStorage();
      final _auth = FirebaseAuth.instance;

      ///Get Authenticated User Data
      User? get authUser => _auth.currentUser;


      ///Called from main.dart on app launch
      @override
      void onReady(){
        FlutterNativeSplash.remove();
        screenRedirect();
      }

  ///Function To Show Relevant Screen; redirect if it is user first time to log in to the application to login or onboarding screen
      screenRedirect() async {
        final user = _auth.currentUser;
        if(user != null){
          if(user.emailVerified){
            Get.offAll(()=> const AppNavigator());
          } else {
            Get.offAll(()=> VerifyEmailScreen(email: _auth.currentUser?.email,));
          }
        }
        else {
          ///local Storage
          deviceStorage.writeIfNull('IsFirstTime', true);

          ///Check if its the first time of launching the application.
          deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen());
        }
  }


  ///Sign In  With Google
  Future<UserCredential?> signInWithGoogle() async  {
    try {
      /// Trigger the authenticate user
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      /// Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      /// create a new user credentials
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      /// Once SignIn, return UserCredentials
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (_){
      throw TFirebaseExceptions;
    } on FormatException catch (_){
      throw const TFormatExceptions();
    }  on PlatformException catch (e){
      throw TPlatformExceptions(e.code).message;
    } catch (e){
      if(kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  ///[EmailAuthentication] Login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (_){
      throw TFirebaseExceptions;
    } on FormatException catch (_){
      throw const TFormatExceptions();
    }  on PlatformException catch (e){
      throw TPlatformExceptions(e.code).message;
    } catch (e){
      throw 'Something went wrong. Pls try again';
    }
  }

  ///[EmailAuthentication] Register User,Sign UP
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (_){
      throw TFirebaseExceptions;
    } on FormatException catch (_){
      throw const TFormatExceptions();
    }  on PlatformException catch (e){
      throw TPlatformExceptions(e.code).message;
    } catch (e){
      throw 'Something went wrong. Pls try again';
    }
  }

  ///[EmailAuthentication] Email Verification Mail
  Future<void> sendEmailVerification() async{
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (e){
      throw const TFormatExceptions();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  ///[EmailAuthentication] Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseAuthExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions();
    } on PlatformException catch (e){
      throw TPlatformExceptions(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }



  ///Logout Function used to Log Out users for any valid authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LoginScreen());
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (e){
      throw const TFormatExceptions();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

///Email ForgetPassword
}
