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
                icon: const Icon(Icons.add, color: Color(0xff2D2D2D),  size: 18 ),
                //color: const Color(0xffffffff),
            ),
    
    Text(text, style: const TextStyle(
      fontSize: 16,
      color: Color(0xff2D2D2D),
      fontWeight: FontWeight.w700,
    ),
    ),

      IconButton(
              icon: const Icon(Icons.remove, color: Color(0xff2D2D2D),  size: 18 ),
              onPressed: decrementButton,
              //color: const Color(0xffffffff),
            ),
        
    ]
    );
  }
}

// Container(
//                   height: 24,
//           width: 24,
//           decoration: const BoxDecoration(
//               color: Color(0xff2D2D2D),
//               shape: BoxShape.circle,
//            ),
//             child: IconButton(
//               icon: const Icon(Icons.remove, color: Colors.white,  size: 18 ),
//               onPressed: decrementButton,
//             ),
//              ),
        
//     ]
// );
  