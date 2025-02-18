import 'package:bookhotel/core/common/styles/spacebetween_text_textbutton.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:bookhotel/presentation/views/mains/details/details_page.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/homepage_header.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/hotel_places.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/hotel_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  void onInit() {
    // Ensure the products are categorized upon initialization
    Get.find<HotelProductController>().separateCategories();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final HotelProductController productController = Get.find<HotelProductController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// ColorHeader
            const HomePageHeader(),
            SizedBox(height: height * 0.01),

            /// Other Body Content
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// Around you Text
                      SpacebetweenTextTextbutton(
                        text: 'Around you',
                        buttonText: 'See More',
                        onTap: () {},
                      ),
                      const SizedBox(height: 4),

                      /// Book Hotel
                      SizedBox(
                       height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: false,
                          itemCount: productController.placesAround.length,
                          itemBuilder: (context, index) {
                            final product = productController.placesAround[index];

                            return Padding(
                              padding: EdgeInsets.only(
                                right: index < productController.placesAround.length - 1
                                    ? 10
                                    : 0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  /// Set the selected product
                                  productController.selectProduct(product);

                                  /// Navigate to the product page
                                  Get.to(() => DetailsPage(),
                                    transition: Transition.rightToLeftWithFade,
                                    duration: const Duration(milliseconds: 300),
                                  );
                                },
                                child: HotelProductTile(
                                  hotelName: product.title,
                                  hotelAddress: product.location,
                                  hotelImg: product.imgPaths,
                                  hotelPrice: product.price,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: height * 0.02),

                      /// Place you can visit Text
                      SpacebetweenTextTextbutton(
                        text: 'Place you can visit',
                        buttonText: 'See More',
                        onTap: () {},
                      ),
                      const SizedBox(height: 4),

                      /// Visit Model tile
                      SizedBox(
                        height: 200,
                        child: Obx(() {
                          // Display products under the "visit_around" category
                          final visitAroundProducts = productController.visitAround;

                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: visitAroundProducts.length,
                            itemBuilder: (context, index) {
                              final product = visitAroundProducts[index];

                              return GestureDetector(
                                onTap: () {
                                  /// Set the selected product
                                  productController.selectProduct(product);

                                  /// Navigate to the product page
                                  Get.to(() => DetailsPage(),
                                    transition: Transition.rightToLeftWithFade,
                                    duration: const Duration(milliseconds: 500),
                                  );
                                },
                                child: HotelPlacesAroundTile(
                                  visitTitle: product.title,
                                  visitImgPaths: product.imgPaths,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10.0); // Space between items
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
