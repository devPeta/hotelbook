import 'package:flutter/material.dart';

class AppTextField{
  static InputDecorationTheme TextFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: const Color(0xFFD0D2D1),
    suffixIconColor: const Color(0xFFD0D2D1),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 1, color: Color(0xFF34A853),
        style: BorderStyle.solid,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 1, color: Color(0xFF34A853),
        style: BorderStyle.solid,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 1, color: Color(0xFF2372CF), style: BorderStyle.solid,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 1, color: Colors.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 1, color: Colors.yellow,
      ),
    ),
  );
}