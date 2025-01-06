import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLoaders{
  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const  EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ] ,
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
          ),
          child: Center(
            child: Text(message, style: AppTextStyles.kBodyTextFieldFilled,),
          ),
        ),
      ),
    );
  }

  static successSnackBar({required title, message = '', duration = 3}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const  EdgeInsets.all(10),
      icon: const  Icon(Icons.warning_amber,color: Colors.white,),
    );
  }

  static warningSnackBar({required title, message = '', duration = 3}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const  EdgeInsets.all(10),
      icon: const  Icon(Icons.warning_amber,color: Colors.white,),
    );
  }


  static errorSnackBar({required title, message = '', duration = 3}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const  EdgeInsets.all(10),
      icon: const  Icon(Icons.warning_amber,color: Colors.white,),
    );
  }
}