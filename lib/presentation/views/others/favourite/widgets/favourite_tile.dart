import 'package:bookhotel/core/common/app_rounded_container.dart';
import 'package:bookhotel/core/common/app_rounded_image.dart';
import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:bookhotel/presentation/controller/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteTile extends StatelessWidget {
  final String imgPaths;
  final String name;
  final String location;
  final String price;
  final VoidCallback onPressed;

  const FavouriteTile({
    super.key,
    required this.imgPaths,
    required this.name,
    required this.location,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppRoundedContainer(
            padding: const EdgeInsets.all(8),
            color: const Color(0xfff4f4f4),
            isCircleShape: false,
            child: Stack(
              children: [
                AppRoundedImage(imageUrl: imgPaths, applyImageRadius: true),

                Positioned(
                  top: 12,
                  child: AppRoundedContainer(
                    isCircleShape: false,
                    color: Colors.red.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      '25%',
                      style: GoogleFonts.raleway(
                        color: Colors.green.withOpacity(0.5),
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.raleway(
                    color: const Color(0xff2D2D2D),
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Color(0xff2D2D2D)),
                    const SizedBox(width: 8),
                    Text(
                      location,
                      style: GoogleFonts.raleway(
                        color: const Color(0xff2D2D2D),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.inter(
                        color: Colors.green.withOpacity(0.5),
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff232323),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: const SizedBox(
                        width: 36,
                        height: 36,
                        child: Center(
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}