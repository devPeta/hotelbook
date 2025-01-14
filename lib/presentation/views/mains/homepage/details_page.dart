import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/details_public_facilities_tile.dart';
import 'package:bookhotel/presentation/views/others/schedule/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, }) : super(key: key);

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.pool_outlined, 'text': 'Swimming Pool',},
    {'icon': Icons.restaurant_sharp, 'text': 'Restaurant',},
    {'icon': Icons.sports_basketball_sharp, 'text': 'Basketball Court',},
    {'icon': Icons.golf_course_outlined, 'text': 'Golf Course',},
    {'icon':  Icons.safety_check, 'text': 'Safety Check',},
  ];

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    final  HotelProductController productController = Get.find<HotelProductController>();
    final product = productController.selectedProduct.value;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:[

            ///AppSearch
            const ApplicationBar(title: 'Details Page', leadingIcon: null, centerTitle: false,),
            SizedBox(height: height * 0.01),


            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FanCarouselImageSlider.sliderType2(
                        imagesLink: product!.images,
                        isAssets: false,
                        autoPlay: false,
                        sliderHeight: 200,
                        currentItemShadow: const [], // Shadow is handled by Container now
                        sliderDuration: const Duration(milliseconds: 200),
                        imageRadius: 16, // Adds slight rounding to images
                        slideViewportFraction: 1.2,
                      ),

                      SizedBox(height: height * 0.01),
                      ///Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.star_border_purple500_outlined, color: Colors.amber, size: 24,),
                              SizedBox(width: 8,),
                              Text.rich(
                                  TextSpan(
                                      children: [
                                        TextSpan(text: '5.0', ),
                                        TextSpan(text: '(199)', )
                                      ]
                                  )
                              ),
                            ],
                          ),

                          IconButton(onPressed: (){}, icon: const Icon(Icons.share, color: Colors.black45, size: 24,),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),

                      ///HotelName
                      Text(product!.name, style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color(0xff2D2D2D),
                          fontWeight: FontWeight.w700,
                        ),
                      ),),
                      SizedBox(height: 2),

                      ///Address
                      Text(product!.location, style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff2D2D2D),
                          fontWeight: FontWeight.w400,
                        ),
                      ),),
                      SizedBox(height: height * 0.01),

                      ///Public Facillities
                      SizedBox(
                        height: 42,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return PublicFacilitiesTile(
                              icon: items[index] ['icon'],
                              text: items[index] ['text'],
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(width: 16,),
                          itemCount: items.length,
                        ),
                      ),
                      SizedBox(height: height * 0.01),

                      ///Description TExt
                      Text('Description', style:  AppTextStyles.sectionTextStyle),
                      SizedBox(height: height * 0.02),

                      ///DetailsSubTextButton
                      Text(product!.description, style: AppTextStyles.sectionTextStyle.copyWith(color:  const Color(0xff969696), fontSize: 14, fontWeight: FontWeight.w700, ),),
                    ],
                  ),
                ),
              ),
            ),
          ]
        )
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child:  Row(
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline_rounded, color: Color(0xff969696), size: 18,)),
            const SizedBox(width: 8,),
            Expanded(
              child: AppKButton(label: 'Book Now', width: double.infinity, color: const Color(0xff2D2D2D),
                onTap: () {
                  Get.to(() => SchedulePage(),
                    transition: Transition.zoom, // You can try other transitions like zoom, cupertino, etc.
                    duration: const Duration(milliseconds: 500),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


