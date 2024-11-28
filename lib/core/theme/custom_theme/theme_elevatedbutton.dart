import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTElevatedButton{
  static final ElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      foregroundColor: const Color(0xFFFFFFFF),
      backgroundColor: const Color(0xFF34A853),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
      textStyle: GoogleFonts.raleway(
          textStyle: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          )
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      shadowColor: const Color(0xFFffffff).withOpacity(0.4),
    ),
  );
}