import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/data/models/visit_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';




class PlacesAroundPage extends StatefulWidget {
  final VisitAroundModel visitAroundModel;

  const PlacesAroundPage({Key? key, required this.visitAroundModel}) : super(key: key);

  @override
  State<PlacesAroundPage> createState() => _PlacesAroundPageState();
}

class _PlacesAroundPageState extends State<PlacesAroundPage> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final visitAroundModel = widget.visitAroundModel;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image Carousel with `CarouselSlider`
            // PlacesAroundCarouselSlider(
            //   images: visitAroundModel.images ?? [],
            //   onPageChanged: (index) {
            //     setState(() => activeImageIndex = index);
            //   },
            // ),

            /// Main Content
            Expanded(
              child:  SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(padding: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ///Image Caurosel
                        ///PlaceName
                        const Text(''),
                        ///Address
                        const Text(''),
                        ///Rating And Review, Contact Info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            RatingBarIndicator(
                              rating: 3.5,
                              itemCount: 5,
                              itemSize: 18,
                              itemBuilder: (context, index) => const Icon(Icons.star_border_outlined, color: Colors.amber,),
                              direction: Axis.horizontal,
                            ),

                            const PlaceACallTextButton(phoneNumber:'08129425802')
                          ],
                        ),

                    /// Description
                    Text(
                      visitAroundModel.description,
                      style: GoogleFonts.raleway(
                        color: const Color(0xff2D2D2D),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Map Integration
                    SizedBox(
                      height: 300,
                      child: PlacesAroundMap(
                        latitude: visitAroundModel.latitude,
                        longitude: visitAroundModel.longitude,
                      ),
                    ),

                      ],
              ),
            ),
        ),
            ),
          ],
        ),
      ),

      /// Bottom Button
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: AppKButton(
            label: 'Book Now',
            color: const Color(0xff2D2D2D),
            onTap: (){},
          ),
        ),
      ),
    );
  }
}

/// Updated PlaceACallTextButton
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



class PlacesAroundMap extends StatelessWidget {
  final double latitude;
  final double longitude;
  //final LatLng initalCenter = const LatLng(37.7749, -122.4194);

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

class PlacesAroundCarouselSlider extends StatefulWidget {
  PlacesAroundCarouselSlider({Key? key}) : super(key: key);

  @override
  _PlacesAroundCarouselSliderState createState() => _PlacesAroundCarouselSliderState();
}

class _PlacesAroundCarouselSliderState extends State<PlacesAroundCarouselSlider> {
  final List<String> images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Carousel Slider
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: images.map((image) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow:  [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
        ),

        /// Circle Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return Container(
              width: _currentIndex == entry.key ? 12.0 : 8.0,
              height: _currentIndex == entry.key ? 12.0 : 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == entry.key
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.5),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
