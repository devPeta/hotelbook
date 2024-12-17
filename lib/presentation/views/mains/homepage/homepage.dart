
import 'package:bookhotel/core/common/styles/spacebetween_text_textbutton.dart';
import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:bookhotel/data/models/visit_model.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/homepage_header.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/hotel_places.dart';
import 'package:bookhotel/presentation/views/mains/homepage/widgets/hotel_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  final List<BookHotelProduct> bookHotelModel = [
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', onPressed: (){}, name: 'Top Galaxy Hotel', location: 'Sabon Tasha', price: '#45,000'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', onPressed: (){}, name: 'Palm Palace Hotel', location: 'Sabon Tasha', price: '#45,000'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', onPressed: (){}, name: 'Star Hotel', location: 'Kaduna North', price: '#45,000'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', onPressed: (){}, name: 'Raw Hotel', location: 'Ungwan Rimi', price: '#45,000'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', onPressed: (){}, name: 'Royal Hotel', location: 'Trikiana', price: '#45,000'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', onPressed: (){}, name: 'Goshen Hotel', location: 'Ungwan Pama', price: '#45,000'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', onPressed: (){}, name: 'Equatorial Hotel', location: 'Kaduna North', price: '#45,000'),
    BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', onPressed: (){}, name: 'Protect Hotel', location: 'Romi', price: '#45,000'),
  ];

  final List<VisitAroundModel> visitAroundModel = [
    VisitAroundModel(imgPaths: 'assets/images/hotel/place2.png', title: 'Kajuru Castle', onPressed: (){}),
    VisitAroundModel(imgPaths: 'assets/images/hotel/place1.png', title: 'Kaduna Museum', onPressed: (){}),
    VisitAroundModel(imgPaths: 'assets/images/hotel/place2.png', title: 'Barcode Lounge', onPressed: (){}),
    VisitAroundModel(imgPaths: 'assets/images/hotel/place1.png', title: 'Kagoro Hills', onPressed: (){}),
    VisitAroundModel(imgPaths: 'assets/images/hotel/place1.png', title: 'Kaduna Museum', onPressed: (){}),
    VisitAroundModel(imgPaths: 'assets/images/hotel/place2.png', title: 'Barcode Lounge', onPressed: (){}),
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
              const HomePageHeader(),
              SizedBox(height: height * 0.01,),


              ///OtherBody Header
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
                      const SizedBox(height: 4,),
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

                      ///Place you can
                      SpacebetweenTextTextbutton(
                          text: 'Place you can visit',
                          buttonText: 'See More', onTap: (){}
                      ),
                      const SizedBox(height: 4,),
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


