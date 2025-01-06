import 'package:bookhotel/data/models/visit_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_infinity_loader/circular_infinity_loader.dart';

class HotelPlacesAroundTile extends StatefulWidget {
  final VisitAroundModel visitAroundModel;

  const HotelPlacesAroundTile({
    Key? key,
    required this.visitAroundModel}) : super(key: key);

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
                image: AssetImage(widget.visitAroundModel.imgPaths),
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
            const SizedBox(
              height: 50,
              width: 50,
              child: CircularInfinityLoader(
                color: Color(0xff2D2D2D),
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
                child: GestureDetector(
                  onTap: widget.visitAroundModel.onTap,
                  child: Text(
                    widget.visitAroundModel.title,
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
          ),
        ],
      ),
    );
  }
}
