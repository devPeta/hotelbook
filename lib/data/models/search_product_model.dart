import 'package:flutter/material.dart';

class SearchProductModel {
  final String text;
  final String imgPaths;
  final VoidCallback? onTap; // Nullable onTap callback

  const SearchProductModel(
      this.text, {
        this.onTap, // Optional parameter
        required this.imgPaths,
      });

  String get searchProductImgPaths => imgPaths;
  String get searchProductText => text;
  VoidCallback? get searchProductTap => onTap; // Returns nullable VoidCallback
}