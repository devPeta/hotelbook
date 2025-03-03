import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Import the HotelProductController

class ScheduleController extends GetxController {
  RxInt hours = 1.obs;
  RxDouble totalPrice = 0.0.obs;

  // The hotel controller is injected into the details controller
  final HotelProductController hotelProductController = Get.find();

  @override
  void onInit() {
    super.onInit();
    // Whenever the selected hotel changes, we need to recalculate the total price
    ever(hotelProductController.selectedProduct, (_) => updatePriceBasedOnHours());
  }

  void increasedHours() {
    hours.value++;
    updatePriceBasedOnHours();
  }

  void decreasedHours() {
    if (hours.value > 1) {
      hours.value--;
      updatePriceBasedOnHours();
    } else {
      Get.snackbar(
        'Error',
        "Time can't be less than 1 hour",
        icon: const Icon(Icons.warning_amber, color: Colors.white, size: 12),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  // This method will update the price based on the selected hotel and hours
  void updatePriceBasedOnHours() {
    if (hotelProductController.selectedProduct.value != null) {
      var selectedHotel = hotelProductController.selectedProduct.value!;
      totalPrice.value = selectedHotel.basePrice * hours.value;
    }
  }
}
