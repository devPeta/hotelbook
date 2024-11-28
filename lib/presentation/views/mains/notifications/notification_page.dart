import 'package:bookhotel/core/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                ///AppBar
                ApplicationBar(appbarTitle: 'Notifications',),


                NotificationTile(notificationTitle: 'Your payment was successful',
                    notificationSubTitle: 'Your payment for hotel bookings with No. Reservation 0123456789 was successful \$308',
                    date: 'Today, 02:58 PM',
                    icon: Icons.check,
                    iconColor: Color(0xff287D3C)
                ),


                NotificationTile(notificationTitle:'Payment Failed',
                    notificationSubTitle: 'Your payment for hotel booking failed',
                    date: 'Tomorrow, 04:58 PM',
                    icon: Icons.delete_outline_outlined,
                    iconColor: Color(0xffDA1414),
                ),

              ],
            ),
          )
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String notificationTitle;
  final String notificationSubTitle;
  final String date;
  final IconData icon;
  final Color iconColor;

  const NotificationTile({Key? key,
    required this.notificationTitle,
    required this.notificationSubTitle,
    required this.date, required this.icon, required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
               Icon(icon, size: 20, color: iconColor,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                            Text(notificationTitle, style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff2D2D2D),
                            ),),

                            SizedBox(height: 4,),
                            Text(notificationSubTitle,
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff2D2D2D),
                              ),
                            ),
                           SizedBox(height: 8,),
                            Text(date,  style: GoogleFonts.raleway(
                              fontSize:10,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff818181),
                            ),
                            ),
                      ],
                    )
                  ],
                )


        ],
        )
      ],
    );
  }
}