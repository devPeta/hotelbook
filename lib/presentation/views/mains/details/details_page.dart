import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:bookhotel/presentation/controller/favourite_controller.dart';
import 'package:bookhotel/presentation/views/mains/details/widgets/details_banner_image.dart';
import 'package:bookhotel/presentation/views/mains/details/widgets/place_a_call.dart';
import 'package:bookhotel/presentation/views/mains/details/widgets/places_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/details_public_facilities_tile.dart';
import 'package:bookhotel/presentation/views/others/schedule/schedule_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, }) : super(key: key);

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.pool_outlined, 'text': 'Swimming Pool'},
    {'icon': Icons.restaurant_sharp, 'text': 'Restaurant'},
    {'icon': Icons.sports_basketball_sharp, 'text': 'Basketball Court'},
    {'icon': Icons.golf_course_outlined, 'text': 'Golf Course'},
    {'icon': Icons.safety_check, 'text': 'Safety Check'},
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final HotelProductController productController = Get.find<HotelProductController>();
    final FavouriteController favouriteController = Get.find<FavouriteController>();
    final product = productController.selectedProduct.value;

    if (product == null) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()), // Show loading state if product is null
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Banner image with no shimmer effect
            DetailsBannerImage(imgBanner: product.images),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.01),
                      // Rating and Review, Contact Info (no shimmer effect)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBarIndicator(
                            rating: 3.5,
                            itemCount: 5,
                            itemSize: 18,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_border_outlined,
                              color: Colors.amber,
                            ),
                            direction: Axis.horizontal,
                          ),
                          const PlaceACallTextButton(phoneNumber: '08129425802'),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      // Hotel Name (no shimmer effect)
                      Text(
                        product.title,
                        style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      // Address (no shimmer effect)
                      Text(
                        product.location,
                        style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: height * 0.01),
                      // Public Facilities (no shimmer effect)
                      SizedBox(
                        height: 42,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: false,
                          itemBuilder: (context, index) {
                            return PublicFacilitiesTile(
                              icon: items[index]['icon'],
                              text: items[index]['text'],
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(width: 16),
                          itemCount: items.length,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      // Description Text (no shimmer effect)
                      Text('Description', style: AppTextStyles.sectionTextStyle),
                      SizedBox(height: height * 0.02),
                      // Details Sub Text Button (no shimmer effect)
                      Text(
                        product.description,
                        style: AppTextStyles.sectionTextStyle.copyWith(
                          color: const Color(0xff969696),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: PlacesAroundMap(
                          latitude: product.latitude,
                          longitude: product.longitude,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                // Toggle the favorite status when pressed
                favouriteController.toggleFavourite(product);
              },
              icon: Obx(() {
                return Icon(
                  favouriteController.isFavourite(product)
                      ? Icons.favorite
                      : Icons.favorite_outline_rounded,
                  color: const Color(0xff969696),
                  size: 18,
                );
              }),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: AppKButton(
                label: 'Book Now',
                width: double.infinity,
                color: const Color(0xff2D2D2D),
                onTap: () {
                  Get.to(
                        () => SchedulePage(),
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 500),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
