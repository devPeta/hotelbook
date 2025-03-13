import 'package:get/get.dart';
import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:flutter/material.dart';

class FavouriteController extends GetxController {
  // Observable list of favorite hotels
  var favouriteHotels = <BookHotelProduct>[].obs;

  // Method to check if a hotel is in the favorite list
  // bool isFavourite(BookHotelProduct hotel) {
  //   return favouriteHotels.any((favorite) =>
  //   favorite.title == hotel.title && favorite.location == hotel.location);
  // }

  // // Method to toggle the favorite status
  // void toggleFavourite(BookHotelProduct hotel) {
  //   if (isFavourite(hotel)) {
  //     favouriteHotels.removeWhere((favorite) =>
  //     favorite.title == hotel.title && favorite.location == hotel.location);
  //     _showSnackbar('Removed from Favorites');
  //   } else {
  //     favouriteHotels.add(hotel);
  //     _showSnackbar('Added to Favorites');
  //   }
  // }
  bool isFavourite(BookHotelProduct hotel) {
  return favouriteHotels.any((favorite) => favorite == hotel);
}

void toggleFavourite(BookHotelProduct hotel) {
  if (isFavourite(hotel)) {
    favouriteHotels.removeWhere((favorite) => favorite == hotel);
    _showSnackbar('Removed from Favorites');
  } else {
    favouriteHotels.add(hotel);
    _showSnackbar('Added to Favorites');
  }
}


  // Helper method to show a snackbar with the appropriate message
  void _showSnackbar(String message) {
    Get.snackbar(
      'Favorite Status',
      message,
      icon: const Icon(Icons.favorite, color: Colors.white),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }
}
