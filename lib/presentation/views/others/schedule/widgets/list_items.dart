import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItems extends StatelessWidget {
  final String itemName;
  final Color itemColor;
  final String itemCost;
  final Color itemCostColor;
  const ListItems({
    super.key,
    required this.itemName,
    required this.itemCost,
    required this.itemColor,
    required this.itemCostColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(itemName, style: GoogleFonts.raleway(
          textStyle: TextStyle(
            fontSize: 16,
            color: itemColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        ),

        Text(itemCost, style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 16,
            color: itemCostColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        ),
      ],
    );
  }
}