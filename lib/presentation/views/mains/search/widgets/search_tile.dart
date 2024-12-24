import 'package:flutter/material.dart';
import 'package:bookhotel/data/models/search_product_model.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchTile extends StatelessWidget {
  final SearchHotelModel searchHotelModel;
  const SearchTile({Key? key, required this.searchHotelModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ///Image
            Container(
              height: 100, width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: AssetImage(searchHotelModel.hotelImage, ),
                ),
              ),
            ),

            const SizedBox(width: 8,),

            ///Column Hotel Name, Location
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(searchHotelModel.searchHotelName, style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  ),
                  const SizedBox(height: 2,),
                  Text(searchHotelModel.searchHotelLocation, style: GoogleFonts.raleway(
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

        ///Price
        GestureDetector(
          onTap: searchHotelModel.searchHotelTap,
          child: const Center(child: Icon(Icons.circle, color: Colors.green, size: 10,)),
          ),
      ],
    );
  }
}
