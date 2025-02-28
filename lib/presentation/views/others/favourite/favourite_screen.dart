import 'package:bookhotel/presentation/controller/favourite_controller.dart';
import 'package:bookhotel/presentation/views/others/favourite/widgets/favourite_tile.dart';
import 'package:bookhotel/core/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritePage extends StatelessWidget {
  final FavouriteController favouriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              ApplicationBar(
                title: 'Favourite',
                centerTitle: false,
                showBackArrow:false,
              ),

            Expanded(
              child: Obx(() {
                // Check if there are no favorite hotels
                if (favouriteController.favouriteHotels.isEmpty) {
                  return Center(
                    child: Text(
                      'No Favorites Yet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: favouriteController.favouriteHotels.length,
                    itemBuilder: (context, index) {
                      final hotel = favouriteController.favouriteHotels[index];
                      return FavouriteTile(
                        imgPaths: hotel.imgPaths,
                        name: hotel.title,
                        location: hotel.location,
                        price: hotel.price,
                        onPressed: () {
                          favouriteController.toggleFavourite(hotel);
                        },
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
