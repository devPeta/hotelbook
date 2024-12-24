import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
            const SizedBox(width: 8,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(notificationTitle, style: GoogleFonts.raleway(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff2D2D2D),
                    ),
                    ),

                    const SizedBox(height: 8,),
                    Text(notificationSubTitle,
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff2D2D2D),
                      ),
                      softWrap: true, // Ensures the text wraps to the next line
                      overflow: TextOverflow.visible, // Ensures the full text is visible
                    ),

                    const SizedBox(height: 12,),
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