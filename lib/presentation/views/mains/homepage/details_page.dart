import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/styles/spacebetween_text_textbutton.dart';
import 'package:bookhotel/core/constant/textstring_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    var headerText = GoogleFonts.raleway(
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color(0xff2D2D2D),
        fontWeight: FontWeight.w500,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:[

              ///Image
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(''),
                  ),
                ),
              ),

              ///HotelName And Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('', style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Color(0xff2D2D2D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ),
                  Text('', style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xffE77200),
                      fontWeight: FontWeight.w500,
                  ),
                 ),
                  ),
                ],
              ),


              ///Address And Icon
              Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 12, color: Color(0xff969696),), //
                  Text('Jakarta, Indonesia', style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff969696),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ),
                ],
              ),

              ///RoomFacilities
              Text('Room facilities', style: headerText
              ),

              ///Public facilities
              SpacebetweenTextTextbutton(
                  text: 'Public facilities',
                  buttonText: 'See More', onTap: (){}
              ),

              Row(
                children: [

                  publicfacilitiestitle(icon: null, text: '',)
                ],
              ),
              ///Room Type facilities
              ///RoomFacilities
              Text('Room type', style: headerText
              ),

              ///Description
              Text('Description', style: headerText
              ),
              Text(AppString.detailssubText, style: headerText.copyWith(color:  const Color(0xff969696), fontSize: 13, fontWeight: FontWeight.w500, )
              ),
              ///Book Now Button
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline_rounded, color: Color(0xff969696), size: 14,)),
                  const SizedBox(width: 8,),
                  AppKButton(label: 'Book Now', width: double.infinity,)
                ],
              )
            ]
          ),
        )
      )
    );
  }
}

class publicfacilitiestitle extends StatelessWidget {
  final IconData icon;
  final String text;

  const publicfacilitiestitle({
    super.key, required this.icon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.transparent,
              decoration: BoxDecoration(
          border: Border.all(
          color: const Color(0xff2D2D2D),
          style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8),
          ),
       child: Padding(
         padding: const EdgeInsets.all(4.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(icon, color: Color(0xff2D2D2D), size: 20,,),
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
