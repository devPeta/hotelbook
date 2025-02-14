import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:bookhotel/presentation/views/mains/search/widgets/search_tile.dart';
import 'package:flutter/material.dart';
import 'package:bookhotel/core/common/apptextfield.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _hotelController = Get.put(HotelProductController());
  List<BookHotelProduct> displayList = [];

  @override
  void initState() {
    super.initState();
    displayList = List.from(_hotelController.bookHotel);
  }

  void updateList(String value) {
    setState(() {
      displayList = _hotelController.bookHotel
          .where((element) =>
          element.title.toLowerCase().contains(value.toLowerCase()))
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
                    onTap: () {
                      _hotelController.selectProduct(displayList[index]);
                    },
                    child: SearchTile(
                      bookHotelProduct: displayList[index],
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

