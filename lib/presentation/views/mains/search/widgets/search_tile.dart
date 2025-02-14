import 'package:flutter/material.dart';
import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTile extends StatelessWidget {
  final BookHotelProduct bookHotelProduct;
  const SearchTile({Key? key, required this.bookHotelProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                /// Image
                Container(
                  height: 70,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: AssetImage(bookHotelProduct.imgPaths),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                /// Column with Hotel Name and Location
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        bookHotelProduct.title,
                        style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        bookHotelProduct.location,
                        style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// Price
            GestureDetector(
              onTap: () {},
              child: const Center(
                child: Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 10,
                ),
              ),
            ),
          ],
      ),
    );
  }
}
