import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/buttonliketextfieldcontainer.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:bookhotel/presentation/views/others/schedule/personal_data_page.dart';
import 'package:bookhotel/presentation/views/others/schedule/widgets/list_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/text_header.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {


  DateTime _selectedDateTo = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTimeRange? _selectedDateRange;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final  HotelProductController productController = Get.find<HotelProductController>();
    final product = productController.selectedProduct.value;

    Future<void> selectDateRange(BuildContext context) async {
      final DateTimeRange? picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
      );

      if (picked != null && picked != _selectedDateRange) {
        setState(() {
          _selectedDateRange = picked;
        });
      }
    }

    Future<void> selectTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
      );

      if (picked != null && picked != _selectedTime) {
        setState(() {
          _selectedTime = picked;
        });
      }
    }

    Future<void> selectedDateTo(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2024),
        lastDate: DateTime(2025),
        initialDate: _selectedDateTo,
      );
      if (picked != null && picked != _selectedDateTo) {
        setState(() {
          _selectedDateTo = picked;
        });
      }
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
                        text: product!.name,
                        suffixIcon: const Icon(Icons.navigate_next_sharp, color: Color(0xff2D2D2D), size: 24),
                      ),
                      SizedBox(height: height * 0.02),

                      const TextHeader(textHeader: 'Location'),
                      ButtonLikeTextField(
                        prefixIcon: const Icon(Icons.location_on_outlined, color: Color(0xff2D2D2D), size: 24),
                        text: product!.location,
                      ),
                      SizedBox(height: height * 0.02),

                      const TextHeader(textHeader: 'Live Date'),
                      Obx(() => ButtonLikeTextField(
                        onTap: () => selectedDateTo(context),
                        text: ' ${_selectedDateTo.toLocal()}',
                        prefixIcon: const Icon(Icons.timer, color: Color(0xff2D2D2D), size: 24),
                      )),
                      SizedBox(height: height * 0.01),

                      const TextHeader(textHeader: 'Check In Date'),
                      Obx(() => ButtonLikeTextField(
                        onTap: () => selectDateRange(context),
                        text: _selectedDateRange == null
                            ? "Select Check-In Date"
                            : "${_selectedDateRange!.start.day}/${_selectedDateRange!.start.month}/${_selectedDateRange!.start.year}",
                        prefixIcon2: const Icon(Icons.calendar_month_rounded, color: Color(0xff287D3C), size: 24),
                        prefixIcon: const Icon(Icons.lock_clock, color: Color(0xff2D2D2D), size: 24),
                      )),
                      SizedBox(height: height * 0.01),

                      Obx(() => ButtonLikeTextField(
                        prefixIcon: const Icon(Icons.lock_clock, color: Color(0xff2D2D2D), size: 24),
                        onTap: () => selectTime(context),
                        text: _selectedTime.format(context),
                      )),
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
                      SizedBox(height: height * 0.02),

                      const Divider(
                        color: Color(0xff2D2D2D),
                        thickness: 2,
                      ),
                      //ListItems(itemName: 'Sub total', itemCost: product!.price, itemColor: const Color(0xffC0C0C0), itemCostColor: Color(0xffC0C0C0)),
                      //const ListItems(itemName: 'Tax', itemCost: '10\%', itemColor: Color(0xffC0C0C0), itemCostColor: Color(0xffC0C0C0)),
                      SizedBox(height: height * 0.01),

                      Obx(() => ListItems(
                        itemName: 'Pay',
                        itemCost: product!.price,
                        itemColor: Color(0xffB95000),
                        itemCostColor: Color(0xffB95000),
                      )),

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
