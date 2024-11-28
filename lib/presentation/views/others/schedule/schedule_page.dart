import 'package:bookhotel/core/common/appbar.dart';
import 'package:flutter/material.dart';
class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    
    
    var textHeaderStyle = TextStyle(
      color: Color(0xff2D2D2D),
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ApplicationBar(appbarTitle: 'Schedule',),
                SizedBox(height: height * 0.01,),

                

              ],
            ),
          )
      ),
    );
  }
}