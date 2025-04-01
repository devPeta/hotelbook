import 'package:flutter/material.dart';
import 'package:bookhotel/data/models/favourite_model.dart';
import 'package:bookhotel/data/models/favourite_provider.dart';
import 'package:bookhotel/presentation/controller/favourite_controller.dart';
import 'package:bookhotel/presentation/views/others/favourite/widgets/favourite_tile.dart';
import 'package:bookhotel/core/common/appbar.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<FavouriteProvider>(
        builder: (context, cartProvider, child) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ApplicationBar(
                  title: 'Favourite',
                  centerTitle: true,
                  showBackArrow: false,
                ),

                if (cartProvider.favourite.isEmpty)
                  const Center(
                    child: Text(
                      'No Favorites Yet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartProvider.favourite.length,
                      itemBuilder: (context, index) {
                        final product = cartProvider.favourite[index];
                        return Dismissible(
                          key: ValueKey(product.name),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) {
                            cartProvider.removeFavouriteItem(product);
                            Get.snackbar(
                              'Item removed',
                              'Item removed from favorites.',
                              backgroundColor: Colors.redAccent,
                              snackPosition: SnackPosition.TOP,
                              colorText: Colors.white,
                              duration: const Duration(seconds: 5),
                            );
                          },
                          child: FavouriteTile(
                            imgPaths: product.imgPaths,
                            name: product.name,
                            location: product.location,
                            price: product.price,
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Proceeding to checkout...')),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
