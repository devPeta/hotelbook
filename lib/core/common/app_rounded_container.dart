import 'package:flutter/material.dart';

class AppRoundedContainer extends StatelessWidget {
  final double? height, width;
  final double? radius;
  final Color color;
  final bool isCircleShape;
  final EdgeInsets padding;
  final Widget child;

  const AppRoundedContainer({
    Key? key, this.height, this.radius,
    this.width, required this.color,
    required this.padding,
    required this.child,
    required this.isCircleShape,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        shape: isCircleShape? BoxShape.circle : BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: Padding(
        padding: padding,
          child: Center(
            child: child,
          )
      ),
    );
  }
}
