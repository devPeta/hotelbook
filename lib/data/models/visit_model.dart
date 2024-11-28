import 'package:flutter/material.dart';
class VisitAroundModel{
  final String imgPaths;
  final String title;
  final VoidCallback? onPressed;
  VisitAroundModel({
    required this.imgPaths,
    required this.title,
    required this.onPressed,
  });

  String get visitImgPaths => imgPaths;
  String get visitTitle => title;
  VoidCallback get onPressedCallback => onPressed!;

}