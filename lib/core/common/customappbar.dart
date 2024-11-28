import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData? iconData;// Title of the AppBar
  final Color backgroundColor; // Background color of the AppBar
  final double elevation; // Shadow elevation
  final List<Widget>? actions; // Optional actions (e.g., icons)

  const CustomAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.blue, // Default color
    this.elevation = 4.0, // Default elevation
    this.actions,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // Standard AppBar height
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          if (elevation > 0)
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, elevation),
              blurRadius: elevation,
            ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          

          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xff2D2D2D),
              ),
            ),
          ),

          // Actions (if any)
          if (actions != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: actions!,
            ),
        ],
      ),
    );
  }
}