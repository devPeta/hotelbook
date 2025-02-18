import 'package:bookhotel/presentation/controller/schedule_controller.dart';
import 'package:bookhotel/presentation/views/others/schedule/widgets/hourtile.dart';
import 'package:flutter/material.dart';
import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/buttonliketextfieldcontainer.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:bookhotel/presentation/views/others/schedule/personal_data_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'widgets/text_header.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime _liveDate = DateTime.now();
  DateTime? _selectedCheckInDate;

  void selectDate(BuildContext context, {required bool isCheckIn}) {
    // Implement date selection logic here
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final HotelProductController productController = Get.find<HotelProductController>();
    final product = productController.selectedProduct.value;
    final _scheduleController = Get.put(ScheduleController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ApplicationBar(title: 'Schedule', leadingIcon: null, showBackArrow: true),
              SizedBox(height: height * 0.01),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        text: product?.title ?? 'Please Select a Place',
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
                        text: 'Live Date: ${DateFormat('yyyy-MM-dd').format(_liveDate)}',
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
                      const TextHeader(textHeader: 'Room & Quantity'),
                      const ButtonLikeTextField(
                        prefixIcon: Icon(Icons.bathroom_outlined, color: Color(0xff2D2D2D), size: 24),
                        text: 'Family Room',
                      ),
                      SizedBox(height: height * 0.03),
                      const Divider(color: Color(0xff2D2D2D), thickness: 2),
                      SizedBox(height: height * 0.01),
                      Row(
                        children:[
                          Obx(() => HourTile(
                              text: _scheduleController.hours.toString(),
                              incrementButton: _scheduleController.increasedHours,
                              decrementButton: _scheduleController.decreasedHours
                          )),
                        ]
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Price', style: GoogleFonts.raleway(fontSize: 14, color: Color(0xff2D2D2D), fontWeight: FontWeight.w600)),
                          // Use Obx to reactively update the price from the controller
                          Obx(() {
                            // Assuming _scheduleController is your ScheduleController instance
                            return Text(
                              '\$${_scheduleController.totalPrice.value.toStringAsFixed(2)}',  // Format as currency if needed
                              style: GoogleFonts.raleway(
                                fontSize: 14,
                                color: Colors.amberAccent,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          }),
                        ],
                      ),
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