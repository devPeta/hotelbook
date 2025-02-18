import 'package:bookhotel/presentation/controller/favourite_controller.dart';
import 'package:bookhotel/presentation/views/others/favourite/widgets/favourite_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritePage extends StatelessWidget {
  final FavouriteController favouriteController = Get.find();

  FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [


            // Use an Obx widget to listen to the changes in favouriteHotel
            Expanded(
              child: Obx(() {
                return favouriteController.favouriteHotels.isEmpty
                    ? Center(child: Text('No Favorites Yet'))
                    : ListView.builder(
                  itemCount: favouriteController.favouriteHotels.length,
                  itemBuilder: (context, index) {
                    final hotel = favouriteController.favouriteHotels[index];
                    return FavouriteTile(
                      imgPaths: hotel.imgPaths,
                      name: hotel.title,
                      location: hotel.location,
                      price: hotel.price,
                      onPressed: () {
                        // Handle favorite removal or additional actions here
                        favouriteController.toggleFavourite(hotel);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}






