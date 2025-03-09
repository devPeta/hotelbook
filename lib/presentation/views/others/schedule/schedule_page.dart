import 'package:bookhotel/presentation/services/database.dart';
import 'package:bookhotel/presentation/views/others/schedule/widgets/hourtile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/buttonliketextfieldcontainer.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:bookhotel/presentation/controller/schedule_controller.dart';
import 'package:bookhotel/presentation/views/others/schedule/personal_data_page.dart';
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

  // Method to open the date picker
  Future<void> selectDate(BuildContext context, {required bool isCheckIn}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isCheckIn ? _selectedCheckInDate ?? DateTime.now() : _liveDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff287D3C), // Customize the primary color
              onPrimary: Colors.white, // Text color on the primary color
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != (isCheckIn ? _selectedCheckInDate : _liveDate)) {
      setState(() {
        if (isCheckIn) {
          _selectedCheckInDate = picked;
        } else {
          _liveDate = picked;
        }
      });
    }
  }

    ///Fetching User Records
  final user = FirebaseAuth.instance.currentUser!;
  

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
              const ApplicationBar(title: 'Schedule', leadingIcon: null, showBackArrow:false),
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
                        text: '${DateFormat('yyyy-MM-dd').format(_liveDate)}',
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
                        children: [
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
                          Obx(() {
                            return Text(
                              '\$${_scheduleController.totalPrice.value.toStringAsFixed(2)}',
                              style: GoogleFonts.raleway(
                                fontSize: 14,
                                color: Colors.amberAccent,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          }),
                        ],
                      ),
                      AppKButton(label: 'Pay Now', width: double.infinity, color: const Color(0xff2D2D2D),
                          onTap: () async {
                            if (_selectedCheckInDate == null) {
                              Get.snackbar("Error", "Please select a check-in date", 
                                snackPosition: SnackPosition.BOTTOM, 
                                backgroundColor: Colors.red, 
                                colorText: Colors.white
                              );
                              return;
                            }

                            Map<String, dynamic> addUserBookingMap = {
                              "Date": _selectedCheckInDate.toString(),
                              "Title": product?.title ?? "No Title",
                              "Location": product?.location ?? "No Location",
                              "Price": _scheduleController.totalPrice.value.toStringAsFixed(2),
                              "Name": user.displayName ?? "Unknown User",
                              "Email": user.email ?? "No Email",
                            };

                            await DatabaseMethods().addUserBooking(addUserBookingMap).then((value) {
                              Get.snackbar("Success", "Booking completed successfully!",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                duration: const Duration(seconds: 3),
                              );
                            }).catchError((error) {
                              Get.snackbar("Error", "Booking failed: $error",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            });
                          },
                      ),
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