import 'package:bookhotel/core/common/appbar.dart';
import 'package:flutter/material.dart';
class SearchPage extends StatelessWidget {
const SearchPage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor:Colors.white,
          body: SafeArea(
              child: Padding(
                  padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    ///AppSearch
                    ApplicationBar(appbarTitle: 'Search',),
                  ],
                ),
              )
          ),
      );
   }
 }
