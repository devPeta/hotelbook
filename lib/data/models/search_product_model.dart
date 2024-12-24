import 'package:flutter/material.dart';

class SearchHotelModel {
  final String hotelName;
  final String  hotelLocation;
  final String hotelImage;
  final VoidCallback? onTap; // Nullable onTap callback

  const SearchHotelModel({
        this.onTap,
        required this.hotelName,
        required this.hotelLocation,
        required this.hotelImage, // Optional parameter
      });

  String get searchHotelImage => hotelImage;
  String get searchHotelLocation => hotelLocation;
  String get searchHotelName => hotelName;
  VoidCallback? get searchHotelTap => onTap; // Returns nullable VoidCallback
}