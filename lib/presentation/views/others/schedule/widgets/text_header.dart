import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextHeader extends StatelessWidget {
  final String textHeader;

  const TextHeader({
    super.key,
    required this.textHeader,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textHeader, style: GoogleFonts.raleway(
      textStyle: const TextStyle(
        fontSize: 16,
        color: Color(0xff2D2D2D),
        fontWeight: FontWeight.w600,
      ),
    ),
    );
  }
}