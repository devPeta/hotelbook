import 'package:bookhotel/core/common/styles/spacebetween_text_textbutton.dart';
import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:bookhotel/data/models/visit_model.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:bookhotel/presentation/controller/places_around_controller.dart';
import 'package:bookhotel/presentation/views/mains/homepage/details_page.dart';
import 'package:bookhotel/presentation/views/mains/homepage/places_around_page.dart';
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
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final  HotelProductController productController = Get.find<HotelProductController>();
    final  PlacesAroundController placesController = Get.find<PlacesAroundController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///ColorHeader
              const HomePageHeader(),
              SizedBox(height: height * 0.01,),


              ///Others Body Content
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ///Around you Text
                          SpacebetweenTextTextbutton(
                              text: 'Around you',
                              buttonText: 'See More', onTap: (){}
                          ),
                          const SizedBox(height: 4,),
                  
                          ///Book Hotel
                          SizedBox(
                            height: 150,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: productController.bookHotel.length,
                              itemBuilder: (context, index) {
                                final product = productController.bookHotel[index];
                                return GestureDetector(
                                  onTap: (){
                                    /// Set the selected product
                                    productController.selectProduct(product);
                                    /// Navigate to the product page
                                    Get.to(() => DetailsPage(),
                                      transition: Transition.fadeIn, // You can try other transitions like zoom, cupertino, etc.
                                      duration: const Duration(milliseconds: 500),
                                    );

                                  },
                                  child: HotelProductTile(
                                   hotelName: product.name,
                                    hotelAddress: product.location,
                                    hotelImg: product.imgPaths,
                                    hotelPrice: product.price,
                                  ),
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(width: 10);
                              },
                            ),
                          ),
                          SizedBox(height: height * 0.02,),
                  
                          ///Place you can Text
                          SpacebetweenTextTextbutton(
                              text: 'Place you can visit',
                              buttonText: 'See More', onTap: (){}
                          ),
                          const SizedBox(height: 4,),
                  
                          ///Visit Model tile
                          SizedBox(
                            height: 200,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                              shrinkWrap: true,
                              itemCount: placesController.visitAroundModel.length,
                              itemBuilder: (context, index) {
                                final places = placesController.visitAroundModel[index];
                                return GestureDetector(
                                 onTap: (){
                                   /// Set the selected product
                                   placesController.selectProduct(places);
                                   /// Navigate to the product page
                                   Get.to(() => PlacesAroundPage(),
                                     transition: Transition.rightToLeftWithFade, // You can try other transitions like zoom, cupertino, etc.
                                     duration: const Duration(milliseconds: 500),
                                   );
                                 },
                                  child: HotelPlacesAroundTile(
                                    visitTitle: places.title,
                                    visitImgPaths: places.imgPaths,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 10.0); // Space between items
                              },
                            ),
                          ),
                        ]
                      )
                    ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}


