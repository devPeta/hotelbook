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


