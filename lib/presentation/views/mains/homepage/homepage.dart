import 'package:bookhotel/core/common/styles/spacebetween_text_textbutton.dart';
import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:bookhotel/data/models/visit_model.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/homepage_header.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/hotel_places.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/hotel_product_tile.dart';
import 'package:flutter/material.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  final List<BookHotelProduct> bookHotelModel = const [
        BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', name: 'Top Galaxy Hotel', location: 'Sabon Tasha', price: '#35,000',
          description: '',
          latitude: 10.3125, longitude: 7.6793,
          images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg'
          ],
        ),
        BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', name: 'Palm Palace Hotel', location: 'Sabon Tasha', price: '#15,000',
            description: '',
            latitude: 10.3125, longitude: 7.6793,
            images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
        ),
        BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', name: 'Star Hotel', location: 'Kaduna North', price: '#40,000',
            description: '',
            latitude: 10.3125, longitude: 7.6793,
            images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
        ),
        BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', name: 'Raw Hotel', location: 'Ungwan Rimi', price: '#25,000',
            description: '',
            latitude: 10.3125, longitude: 7.6793,
            images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
        ),
        BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', name: 'Royal Hotel', location: 'Trikiana', price: '#55,000',
            description: '',
            latitude: 10.3125, longitude: 7.6793,
            images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
        ),
        BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', name: 'Goshen Hotel', location: 'Ungwan Pama', price: '#25,000',
            description: '',
            latitude: 10.3125, longitude: 7.6793,
            images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
        ),
        BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', name: 'Equatorial Hotel', location: 'Kaduna North', price: '#75,000',
          description: '',
          latitude: 10.3125, longitude: 7.6793,
          images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
        ),
        BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', name: 'Protect Hotel', location: 'Romi', price: '#25,000',
          description: '',
          latitude: 10.3125, longitude: 7.6793,
          images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
        ),
  ];
  final List<VisitAroundModel> visitAroundModel = [
      VisitAroundModel(imgPaths: 'assets/images/hotel/place2.png', title: 'Kajuru Castle',  address: 'kajuru LGA, Kaduna South',
        images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg'
        ],
        description: 'Kajuru Castle is a unique medieval-style villa located in Kajuru Local Government Area, Kaduna State, Nigeria. Built between 1981 by a German expatriate, the castle reflects European architectural influences. \n Featuring turrets, an armory, and a dungeon.',
        latitude: 10.3125,
        longitude: 7.6793,
      ),
      VisitAroundModel(imgPaths: 'assets/images/hotel/place3.png', title: 'Kaduna Museum',
        address: 'Ali Akilu Road, Ungwan Sarki, Kaduna',
        images: [
          'assets/images/places/m1.jpg', 'assets/images/places/m2.jpg', 'assets/images/places/m3.jpg'
        ],
        description: 'The Kaduna Museum houses a substantial collection of archaeological, ethnographic, and craft exhibits, reflecting Nigeria rich cultural heritage. \n The museum architecture is also noteworthy, featuring Hausa building structures made from mud and thatch, which adds to its cultural allure.',
        latitude: 10.5076,
        longitude: 7.4364790,
      ),
      VisitAroundModel(imgPaths: 'assets/images/hotel/place2.png',
        title: 'Kagoro Hills',
        address: 'Southern Kaduna, Kaura LGA, Kaduna',
        images: [
          'assets/images/places/2.jpg', 'assets/images/places/3.jpg', 'assets/images/places/6.jpg'
        ],
        description: 'Kagoro Hills is a stunning natural landmark located in southern Kaduna State, Nigeria, near the town of kagoro in Kaura Local Government Area.\n The Hills are surrounded by lush greenery and rocky terrains, making them a popular destination for hikers, natural enthusiasts and tourists. \n Beyond their beauty, the Kagoro Hills hold cultural significance for the Kagoro people, serving as a historical and spiritual site.',
        latitude: 9.5816,
        longitude: 8.47298,
      ),
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///ColorHeader
              const HomePageHeader(),
              SizedBox(height: height * 0.01,),


              ///Others Body Content
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ///Around you Text
                          SpacebetweenTextTextbutton(
                              text: 'Around you',
                              buttonText: 'See More', onTap: (){}
                          ),
                          const SizedBox(height: 4,),
                  
                          ///Book Hotel
                          SizedBox(
                            height: 150,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: bookHotelModel.length,
                              itemBuilder: (context, index) {
                                return HotelProductTile(
                                  bookHotelProduct: bookHotelModel[index],
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(width: 10);
                              },
                            ),
                          ),
                          SizedBox(height: height * 0.02,),
                  
                          ///Place you can Text
                          SpacebetweenTextTextbutton(
                              text: 'Place you can visit',
                              buttonText: 'See More', onTap: (){}
                          ),
                          const SizedBox(height: 4,),
                  
                          ///Visit Model tile
                          SizedBox(
                            height: 200,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                              shrinkWrap: true,
                              itemCount: visitAroundModel.length,
                              itemBuilder: (context, index) {
                                return HotelPlacesAroundTile(
                                  visitAroundModel: visitAroundModel[index],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 10.0); // Space between items
                              },
                            ),
                          ),
                        ]
                      )
                    ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}


