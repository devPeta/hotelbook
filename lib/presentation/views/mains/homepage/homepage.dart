import 'package:bookhotel/core/common/apphometextfield.dart';
import 'package:bookhotel/core/common/styles/header_color_container.dart';
import 'package:bookhotel/core/common/styles/spacebetween_text_textbutton.dart';
import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:bookhotel/data/models/visit_model.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/hotel_places.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/hotel_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  final List<BookHotelProduct> bookHotelModel = [
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', onPressed: (){}, name: 'Top Galaxy Hotel', location: 'Sabon Tasha, Kaduna'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', onPressed: (){}, name: 'Palm Palace Hotel', location: 'Sabon Tasha, Kaduna'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', onPressed: (){}, name: '5 Star Hotel', location: 'Barnawa, Kaduna'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', onPressed: (){}, name: 'Raw Hotel', location: 'Romi, Kaduna'),
  ];

  final List<BookHotelProduct> seeBookHotelModel = [
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', onPressed: (){}, name: 'Royal Hotel', location: 'Trikiana, Kaduna'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', onPressed: (){}, name: 'Goshen Hotel', location: 'Ungwan Pama, Kaduna'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', onPressed: (){}, name: 'Equatorial Hotel', location: 'Kaduna North, Kaduna'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', onPressed: (){}, name: 'Protect Hotel', location: 'Romi, Kaduna'),
  ];

  final List<VisitAroundModel> visitAroundModel = [
    VisitAroundModel(imgPaths: 'assets/images/hotel/place2.png', title: 'Kajuru Castle', onPressed: (){}),
    VisitAroundModel(imgPaths: 'assets/images/hotel/place1.png', title: 'Kaduna Museum', onPressed: (){}),
    VisitAroundModel(imgPaths: 'assets/images/hotel/place2.png', title: 'Barcode Lounge Kaduna', onPressed: (){}),
    VisitAroundModel(imgPaths: 'assets/images/hotel/place1.png', title: 'Kagoro Hills', onPressed: (){}),
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///ColorHeader
              AppHeaderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02,),
        
                    ///AppBar
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Profile
                        CircleAvatar(
                          radius: 12.5,
                          backgroundColor: const Color(0xff2D2D2D),
                          child: CircleAvatar(
                            radius: 12.5,
                            child: Image.asset('assets/images/Profile Picture.png'),
                          ),
                        ),
                        ///Icon Location + Name
                        Center(
                          child:Row(
                            children: [
                              const Icon(Icons.location_on_outlined, color: Colors.white, size: 12,),
                              const SizedBox(width: 4,),
                              Text('Kaduna, Nigeria',
                                style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
        
        
                        ///Notification icon
                        const Icon(Icons.notifications_outlined, size: 32, color: Colors.white,),
                      ],
                    ),
                    SizedBox(height: height * 0.02,),
        
                    ///Find Hotels
                    Text.rich(
                      TextSpan(
                         text: 'Find ',
                        style: GoogleFonts.raleway(fontSize: 20, color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Hotels, Villas,\nLodging',
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                                fontSize: 20, color: Colors.white)
                            ),
                          TextSpan(
                            text: ', that are around you!',
                            style: GoogleFonts.raleway(
                                fontSize: 20, color: Colors.white)
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.01,),
        
                    ///Search For the best Hotels
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: AppHomeTextField(
                            hintText: 'Find the best Hotels',
                          ),
                        ),
                        const SizedBox(width: 8,),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff2194FF),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(Icons.search, color: Colors.white, size: 20,),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01,),
        
        
              Padding(
                    padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ///Around you
                      SpacebetweenTextTextbutton(
                          text: 'Around you',
                          buttonText: 'See More', onTap: (){}
                      ),
                      SizedBox(
                        height: 145,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return HotelProductTile(
                              bookHotelProduct: bookHotelModel[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 6);
                          },
                        ),
                      ),
                      SizedBox(height: height * 0.01,),
        
        
        
                      ///Virtual 360
                      SpacebetweenTextTextbutton(
                          text: 'Virtual 360',
                          buttonText: 'See More',
                          onTap: (){}
                      ),
                      SizedBox(
                        height: 145,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal, // Horizontal scrolling
                          physics: const BouncingScrollPhysics(),
                          itemCount: seeBookHotelModel.length,
                          itemBuilder: (context, index) {
                            return HotelProductTile(
                              bookHotelProduct: seeBookHotelModel[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 15.0); // Space between items
                          },
                        ),
                      ),
                      SizedBox(height: height * 0.01,),
        
        
                      ///Place you can
                      SpacebetweenTextTextbutton(
                          text: 'Place you can visit',
                          buttonText: 'See More', onTap: (){}
                      ),
                      SizedBox(
                        height: 145,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                          physics: const BouncingScrollPhysics(),
                          itemCount: visitAroundModel.length,
                          itemBuilder: (context, index) {
                            return HotelPlacesAroundTile(
                              visitAroundModel: visitAroundModel[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 15.0); // Space between items
                          },
                        ),
                      ),
                       SizedBox(height: height * 0.01,),
                    ]
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
    }
