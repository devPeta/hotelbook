import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
class ApplicationBar extends StatelessWidget {

  final String? title; // Title of the AppBar, it has title and subtitle use column
  final IconData? leadingIcon; // Optional leading icon
  final List<Widget>? actions; // Optional actions
  final bool centerTitle; // Center the title or not
  final Color backgroundColor; // Background color
  final Color titleColor;
  final VoidCallback? leadingOnPressed;// Title text color
  final double elevation;
  final bool showBackArrow;// Elevation for shadow

  const ApplicationBar({
    Key? key,
    this.title,
    this.leadingIcon,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor = Colors.white,
    this.titleColor = const Color(0xff2D2D2D),
    this.elevation = 0,
    this.leadingOnPressed,
    this.showBackArrow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
        padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: ()=> Get.back(), icon: Icon(Icons.arrow_back))
          : leadingIcon!= null ? IconButton(padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: leadingOnPressed, icon: Icon(leadingIcon)
      ) : null,
      title: Text(
        title!,
        style: GoogleFonts.raleway(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: titleColor,
        ),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      actions: actions,
    );
  }
}


