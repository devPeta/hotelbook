import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/buttonliketextfieldcontainer.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:bookhotel/presentation/views/others/schedule/personal_data_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'widgets/text_header.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime? _selectedDateTo;
  DateTime? _selectedCheckInDate;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final HotelProductController productController = Get.find<HotelProductController>();
    final product = productController.selectedProduct.value;

    void selectDate(BuildContext context, {required bool isCheckIn}) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.single,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  setState(() {
                    if (isCheckIn) {
                      _selectedCheckInDate = args.value;
                    } else {
                      _selectedDateTo = args.value;
                    }
                  });
                  Navigator.of(context).pop(); // Close dialog
                },
                initialSelectedDate: isCheckIn ? _selectedCheckInDate : _selectedDateTo,
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ApplicationBar(title: 'Schedule', leadingIcon: null, showBackArrow: true),
              SizedBox(height: height * 0.01),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const TextHeader(textHeader: 'Personal Data'),
                      ButtonLikeTextField(
                        prefixIcon: const Icon(Icons.person_2_outlined, color: Color(0xff2D2D2D), size: 24),
                        onTap: () => Get.to(const PersonalData()),
                        text: 'Check',
                        suffixIcon: const Icon(Icons.navigate_next_sharp, color: Color(0xff2D2D2D), size: 24),
                      ),
                      SizedBox(height: height * 0.02),
                      const TextHeader(textHeader: 'Hotel name'),
                      ButtonLikeTextField(
                        prefixIcon: const Icon(Icons.home_repair_service_outlined, color: Color(0xff2D2D2D), size: 24),
                        text: product?.name ?? 'Please Select a Place',
                        suffixIcon: const Icon(Icons.navigate_next_sharp, color: Color(0xff2D2D2D), size: 24),
                      ),
                      SizedBox(height: height * 0.02),
                      const TextHeader(textHeader: 'Location'),
                      ButtonLikeTextField(
                        prefixIcon: const Icon(Icons.location_on_outlined, color: Color(0xff2D2D2D), size: 24),
                        text: product?.location ?? 'No location available',
                      ),
                      SizedBox(height: height * 0.02),
                      const TextHeader(textHeader: 'Live Date'),
                      ButtonLikeTextField(
                        onTap: () => selectDate(context, isCheckIn: false),
                        text: _selectedDateTo != null
                            ? 'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDateTo!)}'
                            : 'Select Live Date',
                        prefixIcon: const Icon(Icons.timer, color: Color(0xff2D2D2D), size: 24),
                      ),
                      SizedBox(height: height * 0.01),
                      const TextHeader(textHeader: 'Check In Date'),
                      ButtonLikeTextField(
                        onTap: () => selectDate(context, isCheckIn: true),
                        text: _selectedCheckInDate != null
                            ? 'Check-In: ${DateFormat('yyyy-MM-dd').format(_selectedCheckInDate!)}'
                            : 'Select Check-In Date',
                        prefixIcon: const Icon(Icons.calendar_month_rounded, color: Color(0xff287D3C), size: 24),
                      ),
                      SizedBox(height: height * 0.02),
                      const TextHeader(textHeader: 'Room & quantity'),
                      const ButtonLikeTextField(
                        prefixIcon: Icon(Icons.bathroom_outlined, color: Color(0xff2D2D2D), size: 24),
                        text: 'Family Room',
                        prefixIcon2: Icon(Icons.person_outlined, color: Color(0xff2D2D2D), size: 24),
                        text2: '2 adults',
                        prefixIcon3: Icon(Icons.person_outlined, color: Color(0xff2D2D2D), size: 24),
                        text3: 'Zero Kids',
                      ),
                      SizedBox(height: height * 0.03),
                      const Divider(color: Color(0xff2D2D2D), thickness: 2),
                      SizedBox(height: height * 0.01),
                      AppKButton(label: 'Pay Now', width: double.infinity, color: const Color(0xff2D2D2D)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// const ButtonLikeTextField(
// prefixIcon: Icon(Icons.bathroom_outlined, color: Color(0xff2D2D2D), size: 24),
// text: 'Family Room',
// prefixIcon2: Icon(Icons.person_outlined, color: Color(0xff2D2D2D), size: 24),
// text2: '2 adults',
// prefixIcon3: Icon(Icons.person_outlined, color: Color(0xff2D2D2D), size: 24),
// text3: 'Zero Kids',
// ),
// SizedBox(height: height * 0.03),
// ListItems(itemName: product!.name, itemCost: product!.price, itemColor:  Colors.amberAccent, itemCostColor: Colors.amberAccent,),
// SizedBox(height: height * 0.01),
// const Divider(
// color: Color(0xff2D2D2D),
// thickness: 2,
// ),