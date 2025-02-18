import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceACallTextButton extends StatelessWidget {
  final String phoneNumber;

  const PlaceACallTextButton({Key? key, required this.phoneNumber}) : super(key: key);

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not place a call to $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => makePhoneCall(phoneNumber),
      child: Row(
        children: [
          const Icon(Icons.call, color: Color(0xff2D2D2D)),
          const SizedBox(width: 8),
          Text(
            phoneNumber,
            style: GoogleFonts.inter(
              color: const Color(0xff2D2D2D),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}