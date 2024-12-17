import 'package:flutter/material.dart';

class BookHotelProduct{
      final String imgPaths;
      final String name;
      final String location;
      final String price;
      final VoidCallback onPressed;


  const BookHotelProduct({
      required this.imgPaths,
      required  this.onPressed,
    required  this.price,
      required this.name,
      required this.location,
  });

      String get productImgPaths => imgPaths;
      String get productHotelName => name;
      String get productHotelLocation => location;
      String get productPrice => price;
      VoidCallback get onPressedCallback => onPressed;

}