import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppKTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AppKTextButton({Key? key,
    required this.text,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(text,
            style: GoogleFonts.raleway(
            color: const Color(0xff6B6B6B),
            fontSize: 14,
            fontWeight: FontWeight.w700,
              ),
            ),
        ),
      ],
    );
  }
}
