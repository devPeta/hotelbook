import 'package:flutter/material.dart';
class HourTile extends StatelessWidget {

  final String text;
  final VoidCallback incrementButton;
  final VoidCallback decrementButton;

  const HourTile({super.key,
    required this.text,
    required this.incrementButton,
    required this.decrementButton});

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: incrementButton,
                icon: const Icon(Icons.add, color: Color(0xffffffff),  size: 18 ),
            style: IconButton.styleFrom(
              backgroundColor:  const Color(0xff2D2D2D),// Set background to blue
            ),
            ),
    
        Text(text, style: const TextStyle(
          fontSize: 16,
          color: Color(0xff2D2D2D),
          fontWeight: FontWeight.w700,
        ),
        ),

      IconButton(
              icon: const Icon(Icons.remove, color: Color(0xffffffff),  size: 18 ),
              onPressed: decrementButton,
              style: IconButton.styleFrom(
                backgroundColor:  const Color(0xff2D2D2D), // Set background to blue
              ),
            ),
        
    ]
    );
  }
}