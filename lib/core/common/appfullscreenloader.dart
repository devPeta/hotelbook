import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child: Center(
              child:  Column(
                children: [
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xff2D2D2D),
                    ), // Customize the color here
                  ),
                  const SizedBox(height: 16,),
                  Text(text, style: GoogleFonts.raleway(
                    color: const Color(0xff2D2D2D),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }

  //Stop loading
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}