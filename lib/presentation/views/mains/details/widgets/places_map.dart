import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class PlacesAroundMap extends StatelessWidget {
  final double latitude;
  final double longitude;

  PlacesAroundMap({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  // Function to open Google Maps
  void _openGoogleMaps() async {
    final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not open Google Maps";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openGoogleMaps, // Open Google Maps when tapped
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(latitude, longitude),
          zoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(latitude, longitude),
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
