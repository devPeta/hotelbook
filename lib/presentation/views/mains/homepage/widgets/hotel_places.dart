import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelPlacesAroundTile extends StatefulWidget {
  final String visitTitle;
  final String visitImgPaths;


  const HotelPlacesAroundTile({
    Key? key,
    required this.visitTitle,
    required this.visitImgPaths,
   }) : super(key: key);

  @override
  State<HotelPlacesAroundTile> createState() => _HotelPlacesAroundTileState();
}

class _HotelPlacesAroundTileState extends State<HotelPlacesAroundTile> {
  bool _isImageLoaded = false;

  @override
  void initState() {
    super.initState();
    _simulateImageLoading(); // Simulates image loading (use real logic for async assets or network)
  }

  Future<void> _simulateImageLoading() async {
    // Simulate a delay to mimic image loading (for demonstration purposes)
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isImageLoaded = true; // Image is loaded
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 152,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background image container
          Container(
            height: 190,
            width: 152,
            decoration: BoxDecoration(
              image: _isImageLoaded
                  ? DecorationImage(
                image: AssetImage(widget.visitImgPaths),
                fit: BoxFit.fill,
              )
                  : null, // Only apply the image if it's loaded
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
              ),
              color: Colors.grey.shade200, // Placeholder background color
            ),
          ),

          // Circular loader (visible only while the image is loading)
          if (!_isImageLoaded)
            const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Color(0xff2D2D2D),
                ),
              ),
            ),

          // Gradient overlay and title (always present)
          Container(
            height: 190,
            width: 152,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.4),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    widget.visitTitle,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
