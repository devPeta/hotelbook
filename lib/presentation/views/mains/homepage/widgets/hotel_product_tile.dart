import 'package:bookhotel/core/common/app_rounded_container.dart';
import 'package:bookhotel/core/common/app_rounded_image.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class HotelProductTile extends StatefulWidget {
  final String hotelName;
  final String hotelAddress;
  final String hotelImg;
  final String hotelPrice;

  const HotelProductTile({
    Key? key,
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelImg,
    required this.hotelPrice,
  }) : super(key: key);

  @override
  State<HotelProductTile> createState() => _HotelProductTileState();
}

class _HotelProductTileState extends State<HotelProductTile> {
  bool isActive = false; // Tracks the favorite icon state
  final HotelProductController controller = HotelProductController();

  @override
  Widget build(BuildContext context) {
    // Trigger the image loading simulation
    controller.loadImage();

    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xfff4f4f4),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 6),

          /// Hotel Image and Thumbnail Design
          Container(
            height: 120,
            padding: const EdgeInsets.all(1),
            color: Colors.white,
            child: Stack(
              children: [
                /// Thumbnail Image
                Obx(() {
                  return SizedBox(
                    height: 120,
                    width: 120,
                    child: controller.isImageLoaded.value
                        ? AppRoundedImage(
                      fit: BoxFit.cover,
                      imageUrl: widget.hotelImg,
                      padding: const EdgeInsets.all(2),
                      applyImageRadius: true,
                    )
                        : const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Color(0xff2D2D2D),
                        ),
                      ),
                    ),
                  );
                }),

                /// Sale Tag
                Positioned(
                  top: 12,
                  left: 8,
                  child: SizedBox(
                    height: 24,
                    width: 36,
                    child: AppRoundedContainer(
                      isCircleShape: false,
                      radius: 4,
                      color: Colors.red.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 4),
                      child: Text(
                        '25%',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),

                /// Favorite Toggle Icon
                Positioned(
                  top: 12,
                  right: 8,
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: AppRoundedContainer(
                      isCircleShape: false,
                      radius: 4,
                      color: Colors.white.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 4),
                      child: GestureDetector(
                        onTap: _toggleFavorite,
                        child: Icon(
                          Icons.favorite_outlined,
                          color: isActive
                              ? const Color(0xffDA1414)
                              : const Color(0xff6B6B6B),
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Hotel Details: Name, Address, Price
          SizedBox(
            width: 160,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, top: 16.0, right: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Hotel Name
                  Text(
                    widget.hotelName,
                    style: GoogleFonts.raleway(
                      color: const Color(0xff2D2D2D),
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),

                  /// Hotel Location with Icon
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff2194FF),
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.hotelAddress,
                          style: GoogleFonts.raleway(
                            color: const Color(0xff6B6B6B),
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  /// Hotel Price
                  Text(
                    widget.hotelPrice,
                    style: GoogleFonts.inter(
                      color: const Color(0xff2194FF),
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Toggles the favorite state
  void _toggleFavorite() {
    setState(() {
      isActive = !isActive;
    });
  }
}

// class HotelProductTile extends StatefulWidget {
//   // final BookHotelProduct bookHotelProduct;
//   final String hotelName;
//   final String hotelAddress;
//   final String hotelImg;
//   final String hotelPrice;
//
//   const HotelProductTile({
//     Key? key,
//     required this.hotelName,
//     required this.hotelAddress,
//     required this.hotelImg,
//     required this.hotelPrice,
//   }) : super(key: key);
//
//   @override
//   State<HotelProductTile> createState() => _HotelProductTileState();
// }
//
// class _HotelProductTileState extends State<HotelProductTile> {
//   bool isActive = false; // To track the favorite icon state
//   final HotelProductController controller = HotelProductController();
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     // Trigger the image loading simulation
//     controller.loadImage();
//
//     return  Container(
//       width: 300,
//       decoration: BoxDecoration(
//         color: const Color(0xfff4f4f4),
//         borderRadius: BorderRadius.circular(4),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.9),
//             spreadRadius: 0,
//             blurRadius: 6,
//             offset: const Offset(0, 4), // Shadow position
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           SizedBox(width: 6,),
//           ///Image Url And Thumb Nail Design
//           Container(
//             height: 120,
//             padding: const EdgeInsets.all(1),
//             color: Colors.white,
//             child: Stack(
//               children: [
//                 ///Thumbnail
//               Obx(() {
//                 return SizedBox(
//                   height:120,
//                   width: 120,
//                   child: controller.isImageLoaded.value
//                       ? AppRoundedImage(
//                     fit: BoxFit.cover,
//                     imageUrl: widget.hotelImg,
//                     padding: const EdgeInsets.all(2),
//                     applyImageRadius: true,
//                   )
//                       : const Center(
//                       child: SizedBox(
//                         height: 20,
//                         width: 20,
//                         child: CircularProgressIndicator(
//                         color: Color(0xff2D2D2D),
//                                            ),
//                       ),
//                   ),
//                 );
//               }),
//
//
//                 ///Sale Tag
//                 Positioned(
//                     top: 12,
//                     left: 8,
//                     child: SizedBox(
//                       height:24, width: 36,
//                       child: AppRoundedContainer(
//                         isCircleShape: false,
//                         radius: 4,
//                         color: Colors.red.withOpacity(0.5),
//                         padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
//                         child: Text('25%', style: GoogleFonts.inter(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w800,
//                           fontSize: 10,
//                         ),
//                         ),),
//                     ),
//                     ),
//
//                 ///ToggleIcon
//                 Positioned(
//                   top: 12,
//                   right: 8,
//                   child: SizedBox(
//                     height: 24, width: 24,
//                     child: AppRoundedContainer(
//                       isCircleShape: false,
//                       radius: 4,
//                       color: Colors.white.withOpacity(0.5),
//                       padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
//                       child: GestureDetector(
//                         onTap: _toggleFavorite,
//                         child: Icon(
//                           Icons.favorite_outlined,
//                           color: isActive ? const Color(0xffDA1414) : const Color(0xff6B6B6B),
//                           size: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//
//           /// Hotel Name, Location Details And Location Icon
//           SizedBox(
//             width: 160,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0, top: 16.0, right: 8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//
//                       const SizedBox(height: 12),
//                       /// Hotel Name
//                       Text(
//                         widget.hotelName,
//                         style: GoogleFonts.raleway(
//                           color: const Color(0xff2D2D2D),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//
//                       const SizedBox(height: 8),
//                       /// Location and Favorite Icon
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           /// Location Details
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.location_on_outlined,
//                                 color: Color(0xff2194FF),
//                                 size: 12,
//                               ),
//                               const SizedBox(width: 4),
//                               Text(
//                                 widget.hotelAddress,
//                                 style: GoogleFonts.raleway(
//                                   color: const Color(0xff6B6B6B),
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                                 overflow: TextOverflow.fade,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//
//                      const SizedBox(height: 8),
//                       ///Price And Cart Page
//                       Text(widget.hotelPrice,  style: GoogleFonts.inter(
//                         color:const Color(0xff2194FF),
//                         fontWeight: FontWeight.w800,
//                         fontSize: 14,
//                       ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//       ],
//     ),
//     );
//   }
//
//   /// Toggles the favorite state
//   void _toggleFavorite() {
//     setState(() {
//       isActive = !isActive;
//     });
//   }
// }
