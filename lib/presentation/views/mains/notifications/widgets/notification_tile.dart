import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationTile extends StatelessWidget {
  final String notificationTitle;
  final String notificationSubTitle;
  final String date;
  final IconData icon;
  final Color iconColor;

  const NotificationTile({
    Key? key,
    required this.notificationTitle,
    required this.notificationSubTitle,
    required this.date,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Notification Icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 12), // Spacing between icon and text

          /// Notification Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notificationTitle,
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff2D2D2D),
                  ),
                ),
                const SizedBox(height: 4),

                Text(
                  notificationSubTitle,
                  style: GoogleFonts.raleway(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff2D2D2D),
                  ),
                ),
                const SizedBox(height: 6),

                Text(
                  date,
                  style: GoogleFonts.raleway(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff818181),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
