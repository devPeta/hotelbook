import 'package:bookhotel/data/models/visit_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HotelPlacesAroundTile extends StatelessWidget {
  final VisitAroundModel visitAroundModel;

  const HotelPlacesAroundTile({
    Key? key,
    required this.visitAroundModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 152,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(16),
        ),
        image: DecorationImage(
            image: AssetImage(visitAroundModel.imgPaths),
            fit: BoxFit.fill
        ),
      ),
      child:  Container(
      decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.4),
            ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          ),
        ),
    child: Stack(
          children: [
              Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                  child: Text(visitAroundModel.title,
                    style: GoogleFonts.inter(
                    color: const Color(0xffFFFFFF),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              ),
      ),
    );
  }
}
