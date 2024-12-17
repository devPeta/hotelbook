import 'package:bookhotel/core/common/app_rounded_container.dart';
import 'package:bookhotel/core/common/app_rounded_image.dart';
import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/data/models/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ApplicationBar(title: 'Favourite',
                  leadingIcon: null,
                actions: [
                  Icon(Icons.add)
                ],),
                SizedBox(height: height * 0.01,),
                
                 const Expanded(
                   child: SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [

                         ///Grid Layout

                       ],
                     ),
                   ),
                 )
              ],
            ),
          )),
    );
  }
}

class FavouriteTile extends StatelessWidget {
  final FavouriteModel favouriteModel;
  const FavouriteTile({
    super.key, required this.favouriteModel,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppRoundedContainer(
            padding: const EdgeInsets.all(8),
            color: const Color(0xfff4f4f4),
            isCircleShape: false,
            child: Stack(
              children: [
                AppRoundedImage(imageUrl: favouriteModel.imgPaths, applyImageRadius: true,),

                ///Sale Tag
                Positioned(
                  top: 12,
                  child: AppRoundedContainer(
                    isCircleShape: false,
                    color: Colors.red.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text('25%', style: GoogleFonts.raleway(
                      color: Colors.green.withOpacity(0.5),
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                    ),),
                ),

                ///ToggleIcon
                Positioned(
                  top: 0,
                  right: 0,
                  child: AppRoundedContainer(
                    isCircleShape: false,
                    color: const Color(0xfff9f9f9),
                    padding: const EdgeInsets.all(8),
                    child:  IconButton(
                      onPressed: (){},
                      icon: const  Icon(
                        Icons.favorite_outlined,
                        color: Color(0xffDA1414),
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8,),
          ///Details
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

              /// Hotel Name
              Text(
              favouriteModel.name,
              style: GoogleFonts.raleway(
                color: const Color(0xff2D2D2D),
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 4,),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, color: Color(0xff2D2D2D), ),
                const SizedBox(width: 8,),
                Text(
                  favouriteModel.location,
                  style: GoogleFonts.raleway(
                    color: const Color(0xff2D2D2D),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
              const SizedBox(height: 4,),

              ///Price And Cart Page
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(favouriteModel.price,  style: GoogleFonts.inter(
                  color: Colors.green.withOpacity(0.5),
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
                ),


                ///Cart
                Container(
                  decoration:const BoxDecoration(
                      color: Color(0xff232323),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomLeft:  Radius.circular(8),
                      )
                  ),
                  child: const SizedBox(
                    width: 36,
                    height: 36,
                    child: Center(child: Icon(Icons.add, color: Colors.white,),
                    ),
                  ),
                )
              ],
            ),
    ],
          ),
          ),
    ),
        ],
      ),
    );
  }
}
