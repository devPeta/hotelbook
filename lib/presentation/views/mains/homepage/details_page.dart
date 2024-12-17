import 'package:bookhotel/core/common/app_rounded_container.dart';
import 'package:bookhotel/core/common/app_rounded_image.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/styles/spacebetween_text_textbutton.dart';
import 'package:bookhotel/core/constant/textstring_constant.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:[

                ///Product Image Slider
                Container(
                  width: double.infinity,
                  color: const Color(0xfff9f9f9),
                  child: Stack(
                    children: [
                      ///Main Image
                    const SizedBox(
                        height: 400,
                        child:    Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/images/hotel/place3.png'),
                                 ),
                          ),
                        ),
                    ),


                      ///Image Slider
                          Positioned(
                            right: 0,
                            bottom: 30,
                            child: SizedBox(
                              height: 80,
                              child: ListView.separated(
                                shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (_, index) =>  AppRoundedImage(
                                      width: 80,
                                      color: Colors.white,
                                      border: Border.all(
                                          color:  Colors.white70
                                      ),
                                      imageUrl: 'assets/images/hotel/place3.png'
                                  ),
                                  separatorBuilder: (_, __) =>
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  itemCount: 4,
                              ),
                            ),
                          ),

                          ]
                        ),
                     ),


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

              ///Percentage And Price
                Row(
                  children: [
                    AppRoundedContainer(
                        color: const Color(0xffE77200),
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      isCircleShape: false,
                        child: Text('10 %', style: GoogleFonts.raleway(
                          textStyle:  const TextStyle(
                            fontSize: 15,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ),

                    const SizedBox(width: 8,),

                    Text('#30,000', style: GoogleFonts.raleway(
                      textStyle:  const TextStyle(
                        fontSize: 15,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),

                ///HotelName
                Text('Palm Palace', style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Color(0xff2D2D2D),
                    fontWeight: FontWeight.w700,
                  ),
                ),),
                SizedBox(height: height * 0.01),

                ///Address
                Text('Kaduna South, Kaduna', style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff2D2D2D),
                    fontWeight: FontWeight.w400,
                  ),
                ),),
                SizedBox(height: height * 0.02),

                ///Public facilities
                SpacebetweenTextTextbutton(
                    text: 'Public facilities',
                    buttonText: 'See More', onTap: (){}
                ),
                SizedBox(height: height * 0.02),
                ListView.separated(
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
                SizedBox(height: height * 0.01),

                ///Description TExt
                Text('Description', style:  AppTextStyles.sectionTextStyle),
                SizedBox(height: height * 0.02),

                ///DetailsSubTextButton
                Text(AppString.detailssubText, style: AppTextStyles.sectionTextStyle.copyWith(color:  const Color(0xff969696), fontSize: 14, fontWeight: FontWeight.w700, )
                ),
              ]
            ),
          )
        ),
      ),

      ///Book Now Button
      bottomSheet: Padding(
          padding: EdgeInsets.all(16),
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline_rounded, color: Color(0xff969696), size: 14,)),
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

class PublicFacilitiesTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const PublicFacilitiesTile({
    super.key, required this.icon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

              decoration: BoxDecoration(
                  color: Colors.transparent,
          border: Border.all(
          color: const Color(0xff2D2D2D),
          style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.white38,
                    offset: Offset(0, 4),
                    spreadRadius: 1,
                    blurStyle: BlurStyle.outer,
                  )
                ]
          ),
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0,),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(icon, color: const Color(0xff2D2D2D), size: 10,),
             const SizedBox(width: 4,),
             Text(text, style: GoogleFonts.raleway(
              textStyle: const TextStyle(
                color: Color(0xff2D2D2D),
                fontSize: 10,
                fontWeight: FontWeight.w500
              )
              ),
             ),
           ],
         ),
       ),
    );
  }
}
