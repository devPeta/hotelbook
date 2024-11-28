import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTOutlinedButtonTheme{
  static final OutlinedButtonTheme = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      foregroundColor: const Color(0xFFFFFFFF),
      backgroundColor: const Color(0xFFFFFFFF).withOpacity(0.2),
      side: const BorderSide(color: Color(0xFFFFFFFF), width: 1,),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
      textStyle: GoogleFonts.raleway(
          textStyle: const TextStyle(
            color: Color(0xFFFEFEFE),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          )
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      shadowColor: const Color(0xFFffffff).withOpacity(0.4),
    ),
  );
}