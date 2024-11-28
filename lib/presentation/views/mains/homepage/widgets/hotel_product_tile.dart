import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HotelProductTile extends StatefulWidget {
  final BookHotelProduct bookHotelProduct;
  
  const HotelProductTile({Key? key,
    required this.bookHotelProduct}) : super(key: key);

  @override
  State<HotelProductTile> createState() => _HotelProductTileState();
}

class _HotelProductTileState extends State<HotelProductTile> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9), // Grey shadow with some transparency
                spreadRadius: 0, // Spread of the shadow
                blurRadius: 6, // Softness of the shadow
                offset: Offset(0, 4), // Position of the shadow (horizontal, vertical)
            ),
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///Image
            Container(
                  width: double.infinity,
                  height: 80,
                  decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          widget.bookHotelProduct.imgPaths,
                      ),
                    fit: BoxFit.fill,
                  ),
                ),
                 child: Container(
                    decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.6),
                      ],
                      begin: Alignment.bottomCenter,
                      stops: const [0.85, 0.45],
                      end: Alignment.topRight,
                    ),
                  ),
            ),
            ),

            const SizedBox(height: 4),
            ///Title
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(widget.bookHotelProduct.name, style: GoogleFonts.raleway(
                color: const Color(0xff2D2D2D),
                fontSize: 12,
                fontWeight: FontWeight.w800,
                ),
              ),
            ),
            ///Location And Favourite Icon
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Color(0xff969696), size: 12,),
                      const SizedBox(width: 4,),
                      Text(widget.bookHotelProduct.location, style: GoogleFonts.raleway(
                        color: const Color(0xff6B6B6B),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                          ),
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        isActive = !isActive; // Toggle the state
                      });
                    },
                    icon: Icon(
                      Icons.favorite_outlined,
                      color: isActive ? const Color(0xffDA1414) : const Color(0xff6B6B6B),
                      size: 14, // Adjust the size as needed
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
