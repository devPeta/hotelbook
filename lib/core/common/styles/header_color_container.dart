import 'package:flutter/material.dart';
class AppHeaderContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const AppHeaderContainer({Key? key, required this.child, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff2D2D2D), Color(0xff2194FF)],
            stops: [0.95, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white54.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
          child: child,
        ),
    );
  }
}
