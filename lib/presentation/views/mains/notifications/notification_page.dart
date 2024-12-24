import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/presentation/views/mains/notifications/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///ApplicationBar
              ApplicationBar(title: 'Notifications',
              leadingIcon:Icons.arrow_back,
              leadingOnPressed: () {
                    Navigator.pop(context);
                },
              ),
              SizedBox(height: screenHeight * 0.01,),

              ///Children
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const NotificationTile(
                        notificationTitle: 'Your payment was successful',
                        notificationSubTitle: 'Your payment for hotel bookings with\nNo Reservation 0123456789 was \nsuccessful \#30,800',
                        date: 'Today, 02:58 PM',
                        icon: Icons.check,
                        iconColor: Color(0xff287D3C)
                    ),

                    SizedBox(height: screenHeight * 0.03,),


                    const NotificationTile(
                      notificationTitle:'Payment Failed',
                        notificationSubTitle: 'Your payment for hotel booking failed',
                        date: 'Tomorrow, 04:58 PM',
                        icon: Icons.delete_outline_outlined,
                        iconColor: Color(0xffDA1414),
                    ),

                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}


