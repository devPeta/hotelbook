import 'package:bookhotel/core/constant/color_constant.dart';
import 'package:flutter/material.dart';



class CircularCurvedContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final EdgeInsets? margin;
  final double? padding;
  final Widget? child;
  final Color backgroundColor;

  const CircularCurvedContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.radius = 400,
    this.padding = 0,
    this.margin,
    this.child,
    this.backgroundColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding:  EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
