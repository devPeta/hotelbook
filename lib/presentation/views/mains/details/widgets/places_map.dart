import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PlacesAroundMap extends StatelessWidget {
  final double latitude;
  final double longitude;
  PlacesAroundMap({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options:MapOptions(
        center: LatLng(latitude, longitude),
        zoom:13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains:['a', 'b', 'c', ],
        ),

        //MarkerLayer
        MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point:LatLng(latitude, longitude),
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 20,
                ),
              )

            ]
        ),
      ],
    );
  }
}