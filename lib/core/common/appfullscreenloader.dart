import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader{

  static void openLoadingDialog( String text, ){
    showDialog(
        context: Get.overlayContext!,
        builder: (_) => PopScope(
          canPop: false,
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child:  CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff2D2D2D),), // Customize the color here
              ),
            ),
          ),
        )
    );
  }

  //Stop loading
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}