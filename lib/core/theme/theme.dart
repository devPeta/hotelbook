
import 'package:bookhotel/core/theme/custom_theme/theme_elevatedbutton.dart';
import 'package:bookhotel/core/theme/custom_theme/theme_outlinedbutton.dart';
import 'package:bookhotel/core/theme/custom_theme/theme_textfield.dart';
import 'package:flutter/material.dart';

class TTheme{
  TTheme._();
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFE8E8E8),
    inputDecorationTheme: AppTextField.TextFieldTheme,
    outlinedButtonTheme: AppTOutlinedButtonTheme.OutlinedButtonTheme,
    elevatedButtonTheme: AppTElevatedButton.ElevatedButtonTheme,
  );
}