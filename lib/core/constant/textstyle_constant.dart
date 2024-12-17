import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles{


  static final TextStyle sectionTextStyle =  GoogleFonts.raleway(
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color(0xff2D2D2D),
      fontWeight: FontWeight.w500,
    ),
  );

  static final TextStyle onBoardingTitle = GoogleFonts.raleway(
    textStyle: const TextStyle(
        fontSize: 25,
        color: Color(0xff2D2D2D),
        height: 1.8,
        fontWeight: FontWeight.w500
    ),
  );
  static final TextStyle onBoardingSubTitle= GoogleFonts.amiko(
    textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black45,
        height: 1.8,
        fontWeight: FontWeight.w300
    ),
  );
  static final TextStyle orLogIn = GoogleFonts.raleway(
    textStyle: const TextStyle(
        fontSize: 8,
        color: Color(0xFFABABAB),
        height: 1.8,
        fontWeight: FontWeight.w500
    ),
  );
  static final TextStyle kGreenBG = GoogleFonts.amiko(
    textStyle: const TextStyle(
        fontSize: 45,
        color: Color(0xFF0DFF4D),
        height: 1.8,
        fontWeight: FontWeight.w300
    ),
  );

  ///Label Big
  static final TextStyle kLabelBlackBg =  GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w800,
        fontSize: 16,
      )
  );
  static final TextStyle kLabelBlackSm =  GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w300,
        fontSize: 10,
      )
  );

  ///bodyTitle
  static final TextStyle kBodyTitleBg = GoogleFonts.averageSans(
    textStyle: const TextStyle(
        fontSize: 36.41,
        color: Color(0xFF000000),
        height: 1.8,
        fontWeight: FontWeight.w500
    ),
  );
  static final TextStyle kBodyTitleNm = GoogleFonts.alatsi(
    textStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontSize: 16,
    ),
  );



  static final TextStyle kBodyTitle = GoogleFonts.alatsi(
    textStyle: const TextStyle(
      color: Color(0xff272D2F),
      fontWeight: FontWeight.w800,
      fontSize: 20.99,
    ),
  );
  static final TextStyle kBodyTitleGreen = GoogleFonts.alatsi(
    textStyle: const TextStyle(
      color: Color(0xff34A853),
      fontWeight: FontWeight.w800,
      fontSize: 26.99,
    ),
  );

  ///bodyText
  static final TextStyle kBodyText1 = GoogleFonts.alatsi(
    textStyle: const TextStyle(
      fontSize: 14,
      color: Color(0xFF111719),
      height: 1.5,
      fontWeight: FontWeight.w300,
    ),
  );
  static final TextStyle kBodyTextField = GoogleFonts.alatsi(
    textStyle: const TextStyle(
        fontSize: 16,
        color: Color(0xFF9796A1),
        height: 1.5,
        fontWeight: FontWeight.w500
    ),
  );
  static final TextStyle kBodyTextFieldFilled = GoogleFonts.alatsi(
    textStyle: const TextStyle(
        fontSize: 16,
        color: Color(0xFF111719),
        height: 1.5,
        fontWeight: FontWeight.w700
    ),
  );
  static final TextStyle kHintTextField = GoogleFonts.alatsi(
    textStyle: const TextStyle(
      fontSize: 16,
      color: Color(0xFFC4C4C4),
      height: 1.5,
      fontWeight: FontWeight.w500,
    ),
  );

  ///TextField
  static final TextStyle hpBodyTextFieldFilled = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      color: Color(0xFF000000),
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  );
  static final TextStyle hpBodyTextFieldFilledWhite = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  );
  static final TextStyle hpHintTextField = GoogleFonts.workSans(
    textStyle: const TextStyle(
        fontSize: 14,
        color: Color(0xFF6C757D),
        fontWeight: FontWeight.w400,
        height: 1.5
    ),
  );

  ///AlreadyText
  static final TextStyle alreadyText = GoogleFonts.amiri(
    textStyle: const TextStyle(
      color: Color(0xFF34A853),
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  );

  ///Buttons
  static final TextStyle kElevatedButtonText = GoogleFonts.averageSans(
      textStyle: const TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 18.77,
        fontWeight: FontWeight.w400,
      )
  );
  static final TextStyle kOutlinedButtonText = GoogleFonts.averageSans(
    textStyle: const TextStyle( color: Color(0xFF34A853),
        fontSize: 18.77,
        fontWeight: FontWeight.w400
    ),
  );

}