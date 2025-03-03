import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppKTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const AppKTextField({
    Key? key,
    this.controller, // Made controller nullable
    this.labelText,  // Made labelText nullable
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.raleway(
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Color(0xff111719),
        ),
      ),
      controller: controller,  // Controller can now be null
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:  GoogleFonts.raleway(
          textStyle: const TextStyle(
            color: Color(0xff111719),
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),// LabelText can now be null
        hintText: hintText,
        prefixIconColor: const Color(0xFF2D2D2D),
        suffixIconColor: const Color(0xFF2D2D2D),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        hintStyle: GoogleFonts.raleway(
          textStyle: const TextStyle(
            color: Color(0xff969696),
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color:  Color(0xFF2D2D2D),
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFF2D2D2D),
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFF2372CF),
            style: BorderStyle.solid,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.yellow,
          ),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}