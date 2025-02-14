import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFullScreenLoader {

  static void openLoadingDialog(String text) {
    showGeneralDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      barrierLabel: "Loading",
      barrierColor: Colors.black.withOpacity(0.5),
      // Fading effect
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xff2D2D2D),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      text!,
                      style: GoogleFonts.raleway(
                        color: const Color(0xff2D2D2D),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Stop loading
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
