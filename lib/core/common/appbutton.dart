import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButtonController extends GetxController {
  var isPressed = false.obs;

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
}

class AppKButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final double height;
  final double width;
  final Color color;
  final double borderRadius;
  final TextStyle textStyle;
  final Border? border;
  final double shadowOpacity;
  final String? imgPaths;

  AppKButton({
    required this.label,
    this.onTap,
    this.height = 41,
    this.width = 315,
    this.color = Colors.white,
    this.borderRadius = 8.0,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w800,
    ),
    this.border,
    this.shadowOpacity = 0.2,
    this.imgPaths,
  });

  final AppButtonController controller = AppButtonController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => controller.onTapDown(),
      onTapUp: (_) => controller.onTapUp(onTap),
      onTapCancel: controller.onTapCancel,
      child: Obx(() => AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [controller.isPressed.value ? color.withOpacity(0.7) : color, const Color(0xff2194FF)],
            stops: const [0.95, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          boxShadow: controller.isPressed.value
              ? []
              : [
            BoxShadow(
              color: Colors.black.withOpacity(shadowOpacity),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imgPaths != null)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    imgPaths!,
                    height: 20,
                    width: 20,
                  ),
                ),
              Text(
                label,
                style: textStyle,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
