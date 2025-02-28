import 'package:bookhotel/core/constant/color_constant.dart';
import 'package:bookhotel/presentation/controller/details_page_controller.dart';
import 'package:bookhotel/presentation/views/mains/details/widgets/circular_curved_container.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/details_rounded_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                top: 15,
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
                top: 15,
                right: 16,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.share, color: Colors.grey, size: 24,),
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