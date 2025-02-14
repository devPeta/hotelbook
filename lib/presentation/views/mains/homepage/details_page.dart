import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/constant/color_constant.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:bookhotel/presentation/controller/details_page_controller.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/details_public_facilities_tile.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/details_rounded_image.dart';
import 'package:bookhotel/presentation/views/others/schedule/schedule_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/circular_curved_container.dart';


class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key,}) : super(key: key);

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.pool_outlined, 'text': 'Swimming Pool',},
    {'icon': Icons.restaurant_sharp, 'text': 'Restaurant',},
    {'icon': Icons.sports_basketball_sharp, 'text': 'Basketball Court',},
    {'icon': Icons.golf_course_outlined, 'text': 'Golf Course',},
    {'icon': Icons.safety_check, 'text': 'Safety Check',},
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final HotelProductController productController = Get.find<HotelProductController>();
    final product = productController.selectedProduct.value;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Shimmer effect applied to the banner image while loading
          product != null
              ? DetailsBannerImage(imgBanner: product.images)
              : Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 250,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.01),
                  // Rating and Review, Contact Info (with shimmer while loading)
                  product != null
                      ? Row(
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
                  )
                      : Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 120,
                          height: 20,
                          color: Colors.white,
                        ),
                        Container(
                          width: 100,
                          height: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),

                  // Hotel Name (with shimmer effect)
                  product != null
                      ? Text(
                    product.title,
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                      : Shimmer.fromColors(
                    baseColor: Colors.grey[600]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 200,
                      height: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2),

                  // Address (with shimmer effect)
                  product != null
                      ? Text(
                    product.location,
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    overflow:TextOverflow.ellipsis,
                  )
                      : Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 150,
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.01),

                  // Public Facilities (with shimmer effect)
                  product != null
                      ? SizedBox(
                    height: 42,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return PublicFacilitiesTile(
                          icon: items[index]['icon'],
                          text: items[index]['text'],
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemCount: items.length,
                    ),
                  )
                      : Shimmer.fromColors(
                    baseColor: Colors.grey!,
                    highlightColor: Colors.grey[100]!,
                    child: Row(
                      children: List.generate(
                        5,
                            (index) => Container(
                          width: 80,
                          height: 30,
                          margin: const EdgeInsets.only(right: 16),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),

                  // Description Text (with shimmer effect)
                  product != null
                      ? Text('Description', style: AppTextStyles.sectionTextStyle)
                      : Shimmer.fromColors(
                    baseColor: Colors.grey[800]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 100,
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  // Details Sub Text Button (with shimmer effect)
                  product != null
                      ? Text(
                    product.description,
                    style: AppTextStyles.sectionTextStyle.copyWith(
                      color: const Color(0xff969696),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                      : Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: product != null
                        ? PlacesAroundMap(
                      latitude: product.latitude,
                      longitude: product.longitude,
                    )
                        : Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline_rounded,
                color: Color(0xff969696),
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: AppKButton(
                label: 'Book Now',
                width: double.infinity,
                color: const Color(0xff2D2D2D),
                onTap: () {
                  Get.to(
                        () => const SchedulePage(),
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


class DetailsBannerImage extends StatelessWidget {
  final List<String > imgBanner;

  const DetailsBannerImage({
    super.key,
    required this.imgBanner,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailsPageController());
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) => controller.updatePageIndicator(index)
              ),
              items: imgBanner.map((url)=> RoundedImage(imgUrl: url,width: double.infinity, height: 250,),).toList(),
            ),

            Positioned(
                top: 10,
                left: 16,
                child: GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.arrow_back_outlined, color: Colors.grey, size: 24,),
                    ),
                  ),
                )),


            Positioned(
                top: 10,
                right: 16,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.favorite_outline_rounded, color: Colors.grey, size: 24,),
                  ),
                )),
          ],
        ),
        const SizedBox(height: 12,),
        Center(
          child:  Obx(()=> Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i<3; i++) CircularCurvedContainer(
                width: 20, height: 4, margin:  const EdgeInsets.only(right: 8),
                backgroundColor: controller.carousalCurrentIndex.value == i ? AppColors.primary : AppColors.grey,
              ),
            ],
          ),
          ),
        ),
      ],
    );
  }
}

class PlaceACallTextButton extends StatelessWidget {
  final String phoneNumber;

  const PlaceACallTextButton({Key? key, required this.phoneNumber}) : super(key: key);

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not place a call to $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => makePhoneCall(phoneNumber),
      child: Row(
        children: [
          const Icon(Icons.call, color: Color(0xff2D2D2D)),
          const SizedBox(width: 8),
          Text(
            phoneNumber,
            style: GoogleFonts.inter(
              color: const Color(0xff2D2D2D),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class PlacesAroundMap extends StatelessWidget {
  final double latitude;
  final double longitude;
  PlacesAroundMap({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options:MapOptions(
        center: LatLng(latitude, longitude),
        zoom:13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains:['a', 'b', 'c', ],
        ),

        //MarkerLayer
        MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point:LatLng(latitude, longitude),
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 20,
                ),
              )

            ]
        ),
      ],
    );
  }
}