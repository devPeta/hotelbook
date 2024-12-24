import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class PlacesAroundPage extends StatefulWidget {
  const PlacesAroundPage({Key? key}) : super(key: key);

  @override
  State<PlacesAroundPage> createState() => _PlacesAroundPageState();
}

class _PlacesAroundPageState extends State<PlacesAroundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            ///AppBar
            const ApplicationBar(
              title: 'Search',
              centerTitle: true,
              showBackArrow: true,
            ),

            ///Other Body Content
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
                              itemSize: 24,
                              itemBuilder: (context, index) => const Icon(Icons.star_border_outlined, color: Colors.amber,),
                              direction: Axis.horizontal,
                            ),

                           const PlaceACallTextButton(),
                          ]
                        ),
                        ///Short Description
                        const Text(''),
                        ///Maps
                        SizedBox(
                          height: 400,
                          child: PlacesAroundMap(),
                        ),
                        ///Share
                      ]
                  ),
                ),
              ),
            ),
          ],
        )
      ),



      ///Book Now
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child:  SizedBox(
          width: double.infinity,
          child: AppKButton(label: 'Book Now', width: double.infinity, color: const Color(0xff2D2D2D),),
        ),
      ),
    );
  }
}

class PlaceACallTextButton extends StatelessWidget {

  final String phoneNumber = '08129425802';

  Future<void> makePhoneCall (String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)){
      await launchUrl(phoneUri);
    } else {
      throw 'Could not reach $phoneNumber';
    }
  }
  const PlaceACallTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => makePhoneCall,
      child: Row(
       children: [
         const Icon(Icons.call, color: Color(0xff2D2D2D),),
         const SizedBox(width: 8,),
         Text('$phoneNumber',  style: GoogleFonts.inter(
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
  final LatLng initalCenter = const LatLng(37.7749, -122.4194);

  PlacesAroundMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options:const MapOptions(
        center: LatLng(10.5105, 7.4165),
        zoom:13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains:['a', 'b', 'c', ],
        ),

        //MarkerLayer
        const MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point:LatLng(10.5105, 7.4165),
                child: Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 14,
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

