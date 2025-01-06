import 'package:bookhotel/core/common/appfullscreenloader.dart';
import 'package:bookhotel/core/common/appnetworkmanager.dart';
import 'package:bookhotel/core/common/appsnackbarloaders.dart';
import 'package:bookhotel/presentation/views/auths/forgetpassword/changepassword_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/authentication/authentication_respository.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  ///Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();


  /// Send Reset Password Email
  sendPasswordResetEmail() async{
    try {
      //Start Loading
      FullScreenLoader.openLoadingDialog('Processing your request...');

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      //Send Email to reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //Removed Loader
      FullScreenLoader.stopLoading();

      //Show Success Screen
      AppLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your password');

      //Redirect to ResetPassword Screen
      Get.to(()=> const SentScreen());
    } catch (e) {}
  }


  resendPasswordResetEmail(String email) async {
    try {
      //Start Loading
      FullScreenLoader.openLoadingDialog('Processing your request...');

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Send Email to reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Removed Loader
      FullScreenLoader.stopLoading();

      //Show Success Screen
      AppLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your password');

      //Redirect to ResetPassword Screen
      Get.to(()=> const SentScreen());
    } catch (e) {}
  }
}