
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class PublicFacilitiesTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const PublicFacilitiesTile({
    super.key, required this.icon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: const Color(0xff2D2D2D),
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.white38,
              offset: Offset(0, 4),
              spreadRadius: 1,
              blurStyle: BlurStyle.outer,
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0,),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xff2D2D2D), size: 14,),
            const SizedBox(width: 4,),
            Text(text, style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                )
            ),
            ),
          ],
        ),
      ),
    );
  }
}