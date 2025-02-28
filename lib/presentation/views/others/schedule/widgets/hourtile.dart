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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Container(
        decoration: const BoxDecoration(
          color: Color(0xff2D2D2D),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(4),
            child: IconButton(onPressed: incrementButton,
                icon: const Icon(Icons.add, color: Colors.white,  size: 18 ),
            ),
        ),
              ),

   Text(text, style: const TextStyle(
      fontSize: 16,
      color: Color(0xff2D2D2D),
      fontWeight: FontWeight.w700,
    ),
    ),

 Container(
          decoration: const BoxDecoration(
              color: Color(0xff2D2D2D),
              shape: BoxShape.circle,
           ),
          child: Padding(
            padding: EdgeInsets.all(4),
            child: IconButton(
              icon: const Icon(Icons.remove, color: Colors.white,  size: 18 ),
              onPressed: decrementButton,
            ),
             ),
          ),
    ]
    );
  }
}
