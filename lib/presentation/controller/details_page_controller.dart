import 'package:get/get.dart';

class DetailsPageController extends GetxController{
  static DetailsPageController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}