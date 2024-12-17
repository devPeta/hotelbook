import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SpacebetweenTextTextbutton extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback? onTap;
  const SpacebetweenTextTextbutton({Key? key,
    required this.text,
    required this.buttonText,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: GoogleFonts.raleway(
        textStyle: TextStyle(
          color: Color(0xff2D2D2D),
          fontWeight: FontWeight.bold,
          fontSize: 16,
          ),
        ),
        ),

        TextButton(onPressed: onTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero, // Removes all padding
            minimumSize: Size.zero,  // Optional: removes minimum size constraints
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Optional: shrinks the touch target
          ),
            child: Text(buttonText,
              style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    color: Color(0xff2194FF),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  )
                ),
            ),
        ),
      ],
    );
  }
}
