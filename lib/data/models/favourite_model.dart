import 'package:flutter/material.dart';

class FavouriteModel{
  final String imgPaths;
  final String name;
  final String location;
  final String price;
  final VoidCallback onPressed;


  const FavouriteModel({
    required this.imgPaths,
    required  this.onPressed,
    required  this.price,
    required this.name,
    required this.location,
  });

  String get favouriteImgPaths => imgPaths;
  String get favouriteHotelName => name;
  String get favouriteHotelLocation => location;
  String get favouritePrice => price;
  VoidCallback get onPressedCallback => onPressed;

}