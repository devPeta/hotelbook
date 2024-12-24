import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';


class HotelProductController extends GetxController {
  var isPressed = false.obs;// Tracks press state for buttons
  RxBool isImageLoaded = false.obs;

  void loadImage() async {
    // Simulate image loading
    await Future.delayed(const Duration(seconds: 2));
    isImageLoaded.value = true; // Mark the image as loaded
  }// Tracks image loading state

  void onTapDown() {
    isPressed.value = true;
  }

  void onTapUp(Function()? onTap) {
    isPressed.value = false;
    if (onTap != null) {
      onTap();
    }
  }

  void onTapCancel() {
    isPressed.value = false;
  }

  /// Function to simulate image loading (or replace with actual logic)
  Future<void> simulateImageLoading() async {
    isImageLoaded.value = false; // Reset loading state
    await Future.delayed(const Duration(seconds: 2)); // Simulate delay
    isImageLoaded.value = true; // Set as loaded after delay
  }
}