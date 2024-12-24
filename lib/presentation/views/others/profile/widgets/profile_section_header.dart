import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileSectionHeader extends StatelessWidget {
  final String title;
  const ProfileSectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title, style: GoogleFonts.raleway(
      textStyle: const TextStyle(
        color: Color(0xff2D2D2D),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    );
  }
}