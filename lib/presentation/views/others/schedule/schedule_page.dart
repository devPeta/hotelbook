import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/buttonliketextfieldcontainer.dart';
import 'package:bookhotel/core/common/styles/spacebetween_text_textbutton.dart';
import 'package:bookhotel/presentation/views/others/schedule/personal_data_page.dart';
import 'package:bookhotel/presentation/views/others/schedule/widgets/list_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'widgets/text_header.dart';
class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    DateTime _selectedDateFrom = DateTime.now();
    DateTime _selectedDateTo = DateTime.now();
    TimeOfDay _selectedTime = TimeOfDay.now();
    DateTimeRange? _selectedDateRange;


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
    Future<void> selectedDateFrom(BuildContext context) async {
      final DateTime? picked = await showDatePicker(context: context,
          firstDate: DateTime(2024),
          lastDate: DateTime(2025),
        initialDate: _selectedDateFrom,
      );
      if(picked!= null && picked!= _selectedDateFrom){
          setState(() {
          _selectedDateFrom = picked;
          });
        }
    }
    Future<void> selectedDateTo(BuildContext context) async {
      final DateTime? picked = await showDatePicker(context: context,
        firstDate: DateTime(2024),
        lastDate: DateTime(2025),
        initialDate: _selectedDateTo,
      );
      if(picked!= null && picked!= _selectedDateTo){
        setState(() {
          _selectedDateTo = picked;
        });
      }
    }
    Future<void> selectedTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(context: context,
        initialTime: _selectedTime,
      );
      if(picked!= null && picked!= _selectedTime){
        setState(() {
          _selectedTime = picked;
        });
      }
    }



    var textHeaderStyle = const TextStyle(
      color: Color(0xff2D2D2D),
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );


    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ApplicationBar(title: 'Schedule', leadingIcon: null, showBackArrow: false,),
                SizedBox(height: height * 0.01,),

                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TextHeader( textHeader: 'Personal Data',),
                        ButtonLikeTextField(
                          prefixIcon:  const Icon(Icons.person_2_outlined, color: Color(0xff2D2D2D), size: 24,),
                          onTap: () => Get.to(const PersonalData()),
                          text: 'Check',
                          suffixIcon: const Icon(Icons.navigate_next_sharp, color: Color(0xff2D2D2D), size: 24,
                          ),
                        ),
                        SizedBox(height: height * 0.02,),
                  
                        const TextHeader( textHeader: 'Hotel name',),
                        const ButtonLikeTextField(
                          prefixIcon: Icon(Icons.home_repair_service_outlined, color: Color(0xff2D2D2D), size: 24,),
                          text: 'Palm Palace Hotel',
                          suffixIcon: Icon(Icons.navigate_next_sharp, color: Color(0xff2D2D2D), size: 24,
                          ),
                        ),
                        SizedBox(height: height * 0.02,),
                  
                        const TextHeader( textHeader: 'Location',),
                        const ButtonLikeTextField(
                          prefixIcon: Icon(Icons.location_on_outlined, color: Color(0xff2D2D2D), size: 24,),
                          text: 'Ungwan Boro',
                        ),
                        SizedBox(height: height * 0.02,),

                        const TextHeader( textHeader: 'Live Date',),
                        ButtonLikeTextField(
                            onTap: () => selectedDateTo(context),
                            text: ' $_selectedDateTo',
                            prefixIcon: const Icon(Icons.timer,
                                color: Color(0xff2D2D2D), size: 24),
                        ),
                        SizedBox(height: height * 0.01,),

                        const TextHeader(textHeader: 'Check In & Check Out Date'),
                        ButtonLikeTextField(
                          onTap: () => selectDateRange(context),
                          text: _selectedDateRange == null
                              ? "Select Check-In Date"
                              : "${_selectedDateRange!.start.day}/${_selectedDateRange!.start.month}/${_selectedDateRange!.start.year}",
                          prefixIcon2: const Icon(
                            Icons.calendar_month_rounded,
                            color: Color(0xff287D3C),
                            size: 24,
                          ),
                          onTap2: () => selectDateRange(context),
                          text2: _selectedDateRange == null
                              ? "Select Check-Out Date"
                              : "${_selectedDateRange!.end.day}/${_selectedDateRange!.end.month}/${_selectedDateRange!.end.year}",
                          prefixIcon: const Icon(
                            Icons.calendar_month_rounded,
                            color: Color(0xffDA1414),
                            size: 24,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        ButtonLikeTextField(
                          prefixIcon: const Icon(
                            Icons.lock_clock,
                            color: Color(0xff2D2D2D),
                            size: 24,
                          ),
                          onTap: () => selectTime(context),
                          text: _selectedTime.format(context),
                        ),
                        SizedBox(height: height * 0.02),
                  
                  
                        ///Room And Quantity
                        const TextHeader(textHeader: 'Room & quantity'),
                        const ButtonLikeTextField(
                          prefixIcon: Icon(Icons.bathroom_outlined, color: Color(0xff2D2D2D), size: 24,),
                          text: 'Family Room',
                  
                          prefixIcon2: Icon(Icons.person_outlined, color: Color(0xff2D2D2D), size: 24,),
                          text2: '2 adults',
                  
                          prefixIcon3: Icon(Icons.person_outlined, color: Color(0xff2D2D2D), size: 24,),
                          text3: 'Zero Kids',
                        ),
                        SizedBox(height: height * 0.02,),
                  
                        ///Payment
                        SpacebetweenTextTextbutton(text: 'Payment',
                            buttonText: 'Change ',
                            onTap: (){}
                        ),
                        const ButtonLikeTextField(
                          prefixIcon: Icon(Icons.credit_card_rounded, color: Color(0xff2D2D2D), size: 24,),
                          text: 'Master Card',
                        ),
                        SizedBox(height: height * 0.02,),
                  
                  
                        const Divider(
                          color: Color(0xffD5D5D5),
                          thickness: 2,
                        ),
                  
                        const ListItems(itemName: 'Sub total', itemCost: '\#34,000', itemColor: Color(0xffC0C0C0), itemCostColor: Color(0xffC0C0C0),),
                        const ListItems(itemName: 'Tax', itemCost: '10\%', itemColor: Color(0xffC0C0C0), itemCostColor: Color(0xffC0C0C0),),
                        SizedBox(height: height * 0.01,),
                  
                        const ListItems(itemName: 'Total', itemCost: '\#30,600', itemColor: Color(0xffB95000), itemCostColor: Color(0xffB95000),),
                  
                  
                        AppKButton(
                          label: 'Pay',
                          width: double.infinity,
                          color: const Color(0xff2d2d2d),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }
}




