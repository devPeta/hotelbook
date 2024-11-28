import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;
  final String hint;

  const CustomDropdownMenu({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    this.hint = 'Select an item',
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      elevation: 0,
      borderRadius: BorderRadius.circular(4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      dropdownColor: Colors.white,
      style: GoogleFonts.alatsi(
          color: Colors.blueGrey,
          fontSize: 12,
          fontWeight: FontWeight.w500,
    ),
      value: selectedItem,
      hint: Text(hint, style: GoogleFonts.alatsi(
            color: const Color(0xff34A853),
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
      ),
      isExpanded: true,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      underline: Container(
        height: 1,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            style: BorderStyle.solid,
            width: 1,
            color: const Color(0xff34A853).withOpacity(0.2),
          )
        ),
      ),
    );
  }
}