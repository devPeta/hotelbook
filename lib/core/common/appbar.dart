import 'package:bookhotel/core/common/appiconpop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ApplicationBar extends StatelessWidget {
  final String? appbarTitle;
  const ApplicationBar({Key? key,
    required this.appbarTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(appbarTitle!,
        style: GoogleFonts.raleway(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: const Color(0xff2D2D2D),
          ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
