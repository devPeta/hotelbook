import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileMenu extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onPressed;
  final IconData icon;

  const ProfileMenu({
    super.key,
    required this.title,
    required this.value,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded( flex: 3,
              child: Text(title, style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                  color: Color(0xff2D2D2D),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Expanded(
              flex: 5,
              child: Text(value, style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: Color(0xff2D2D2D),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Expanded(
                child: Icon(icon, size: 18,)
            ),
          ],
        ),
      ),
    );
  }
}