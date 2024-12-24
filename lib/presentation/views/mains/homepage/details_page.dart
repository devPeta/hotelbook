import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/constant/textstring_constant.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/details_public_facilities_tile.dart';
import 'package:bookhotel/core/common/app_rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);

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
    double width = MediaQuery.of(context).size.width;

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


            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ///Product Image Slider
                    const Center(
                      child: AppRoundedImage(
                        fit: BoxFit.cover,
                        imageUrl:  'assets/images/hotel/place3.png',
                        padding: EdgeInsets.all(2),
                        applyImageRadius: true,
                      ),
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
                    Text('Palm Palace', style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w700,
                      ),
                    ),),
                    SizedBox(height: 2),

                    ///Address
                    Text('Kaduna South, Kaduna', style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),),
                    SizedBox(height: height * 0.01),

                    ///Public facilities
                    // SpacebetweenTextTextbutton(
                    //     text: 'Public facilities',
                    //     buttonText: 'See More', onTap: (){}
                    // ),
                    // SizedBox(height: height * 0.02),
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
                    Text(AppString.detailssubText, style: AppTextStyles.sectionTextStyle.copyWith(color:  const Color(0xff969696), fontSize: 14, fontWeight: FontWeight.w700, ),),
                  ],
                ),
              ),
            ),
          ]
        )
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child:  Row(
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline_rounded, color: Color(0xff969696), size: 18,)),
            const SizedBox(width: 8,),
            Expanded(
              child: AppKButton(label: 'Book Now', width: double.infinity, color: const Color(0xff2D2D2D),),
            ),
          ],
        ),
      ),
    );
  }
}


