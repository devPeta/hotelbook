import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:bookhotel/data/models/search_product_model.dart';
import 'package:bookhotel/presentation/views/mains/search/widgets/search_tile.dart';
import 'package:flutter/material.dart';
import 'package:bookhotel/core/common/apptextfield.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SearchHotelModel> displayList = [];
  final List<SearchHotelModel> searchHotelModel = const [
    SearchHotelModel(hotelName: 'Palm Palace', hotelLocation: 'After former valid, Sabon Tasha, Kaduna', hotelImage: 'assets/images/hotel/hotel1.png'),
    SearchHotelModel(hotelName: 'Royal Guest', hotelLocation: 'Kachia Road, Sabon Tasha, Kaduna', hotelImage: 'assets/images/hotel/hotel2.png'),
    SearchHotelModel(hotelName: 'Goshen Garden', hotelLocation: 'Kachia Road, Sabon Tasha, Kaduna', hotelImage: 'assets/images/hotel/hotel4.png'),
    SearchHotelModel(hotelName: 'Delicia Rest', hotelLocation: 'Ungwan Rimi, Kaduna North', hotelImage: 'assets/images/hotel/hotel3.png'),
    SearchHotelModel(hotelName: 'Starz Hotel', hotelLocation: 'Barnawa, Kaduna South', hotelImage: 'assets/images/hotel/hotel4.png'),
    SearchHotelModel(hotelName: 'Chris Lounge', hotelLocation: 'Ungwan Romi, Kaduna South', hotelImage: 'assets/images/hotel/hotel2.png'),
    SearchHotelModel(hotelName: 'Epitome', hotelLocation: 'Kurmin Mashi, Kaduna North', hotelImage: 'assets/images/hotel/hotel3.png'),
    SearchHotelModel(hotelName: 'Ten Toes', hotelLocation: 'Kafancha, Kaduna South', hotelImage: 'assets/images/hotel/hotel2.png'),
    SearchHotelModel(hotelName: 'Apple Lounge', hotelLocation: 'Sabon Tasha, Kaduna', hotelImage: 'assets/images/hotel/hotel1.png'),
  ];

  @override
  void initState() {
    super.initState();
    displayList = List.from(searchHotelModel);
  }

  void updateList(String value) {
    setState(() {
      displayList = searchHotelModel
          .where((element) =>
      element.hotelName != null &&
          element.hotelName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// App Bar
              const ApplicationBar(
                title: 'Search',
                centerTitle: false,
              ),
              SizedBox(height: height * 0.02),



              AppKTextField(
                labelText: 'Search',
                onChanged: updateList,
                hintText: 'e.g Star hotel, Moonlight hotels etc.',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xff2D2D2D),
                ),
              ),
              SizedBox(height: height * 0.01),


              /// Display List
              Expanded(
                child: displayList.isEmpty
                    ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Oops',
                        style: AppTextStyles.sectionTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'No result found',
                        style: AppTextStyles.sectionTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                )
                    : ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: (){},
                    child: SearchTile(
                      searchHotelModel: displayList[index],
                    ),
                  ),
                  itemCount: displayList.length,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
