import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/presentation/controller/profile_controller.dart';
import 'package:bookhotel/presentation/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class PersonalData extends StatelessWidget {
  PersonalData({Key? key}) : super(key: key);

  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// AppBar
            const ApplicationBar(title: 'Personal Data', leadingIcon: null),
            const SizedBox(height: 4),

            /// Body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Data',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2D2D2D),
                      ),
                    ),
                    const SizedBox(height: 4),

                    /// Personal Information
                    Obx(() => PersonalDataTile(
                      prefixIcon: const Icon(Icons.person_2_outlined, color: Color(0xff2D2D2D), size: 24),
                      text: controller.fullName.value,
                      title: 'Full name',
                      prefixIcon2: const Icon(Icons.location_on_outlined, color: Color(0xff2D2D2D), size: 24),
                      text2: controller.address.value,
                      title2: 'Address',
                      prefixIcon3: const Icon(Icons.credit_card_sharp, color: Color(0xff2D2D2D), size: 24),
                      text3: controller.idNumber.value,
                      title3: 'ID number',
                    )),

                    const SizedBox(height: 12),

                    Text(
                      'Contact',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2D2D2D),
                      ),
                    ),
                    const SizedBox(height: 4),

                    /// Contact Information
                    Obx(() => PersonalDataTile(
                      prefixIcon: const Icon(Icons.email, color: Color(0xff2D2D2D), size: 24),
                      text: controller.email.value,
                      title: 'Email',
                      prefixIcon2: const Icon(Icons.phone, color: Color(0xff2D2D2D), size: 24),
                      text2: controller.phoneNumber.value,
                      title2: 'Phone number',
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:bookhotel/core/common/appbar.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// class PersonalData extends StatelessWidget {
//   const PersonalData({Key? key}) : super(key: key);
//
//   final user = FirebaseAuth.instance.currentUser!;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               ///AppBar
//               const ApplicationBar(title: 'Personal Data', leadingIcon: null,),
//               const SizedBox(height: 4),
//
//               ///Body
//               Expanded(child:
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                    children: [
//                     Text('Data', style: GoogleFonts.raleway(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: const Color(0xff2D2D2D),
//                     ),
//                     ),
//                     const SizedBox(height: 4),
//
//                     const PersonalDataTile(
//                       prefixIcon: Icon(Icons.person_2_outlined, color: Color(0xff2D2D2D),size: 24,), text: 'Yusuf Bagoe', title: 'Full name',
//                       prefixIcon2: Icon(Icons.location_on_outlined, color: Color(0xff2D2D2D),size: 24,), text2: '12 Galadima Road', title2: 'Address',
//                       prefixIcon3: Icon(Icons.credit_card_sharp, color: Color(0xff2D2D2D),size: 24,), text3: '3125089', title3: 'ID number',
//                     ),
//
//                     const SizedBox(height: 12),
//                     Text('Contact', style: GoogleFonts.raleway(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: const Color(0xff2D2D2D),
//                     ),
//                     ),
//
//                     const SizedBox(height: 4),
//                     PersonalDataTile(
//                       prefixIcon: Icon(Icons.email, color: Color(0xff2D2D2D),size: 24,), text: user.email, title: 'Email',
//                       prefixIcon2: Icon(Icons.phone, color: Color(0xff2D2D2D),size: 24,), text2: user.phoneNumber ?? 'Not Set', title2: 'Phone number',
//                     ),
//                   ],
//                 ),
//               )),
//             ],
//           ),
//       ),
//     );
//   }
// }















class PersonalDataTile extends StatelessWidget {
  final Icon prefixIcon;
  final String text;
  final String title;
  final Icon? prefixIcon2;
  final String? title2;
  final String? text2;
  final Icon? prefixIcon3;
  final String? text3;
  final String? title3;

  const PersonalDataTile ({Key? key,
    required this.prefixIcon,
    required this.text,
    this.prefixIcon2,
    this.text2,
    this.prefixIcon3,
    this.text3,
    required this.title,
    this.title2,
    this.title3
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xff2D2D2D).withOpacity(0.4),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///First Row
            Text(title,  style: GoogleFonts.raleway(
              textStyle:  const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xff2D2D2D),
              ),
            ),
              overflow:TextOverflow.ellipsis,
             ),
            const SizedBox(height: 2,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                prefixIcon,
                const SizedBox(width: 8,),
                Text(text,
                  style: GoogleFonts.raleway(
                  textStyle:  const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                  overflow:TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 2,),


            ///SecondRow If Condition
            if ( prefixIcon2 != null || text2!= null || title2!= null)...[
              const Divider(
                color: Color(0xffEAEAEA),
                thickness: 2,
              ),
              const SizedBox(height: 2,),
              Text(title2!,  style: GoogleFonts.raleway(
                textStyle:  const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff2D2D2D),
                ),
              ),
                overflow:TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  prefixIcon2!,
                  const SizedBox(width: 8,),
                  Text(text2!, style: GoogleFonts.raleway(
                    textStyle:  const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2D2D2D),
                    ),
                  ),
                    overflow:TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(height: 2,),
            ],

            ///ThirdRow If Condition
            if ( prefixIcon3 != null || text3!= null || title3!= null )...[
              const Divider(
                color: Color(0xffEAEAEA),
                thickness: 2,
              ),
              const SizedBox(height: 2,),
              Text(title3!,  style: GoogleFonts.raleway(
                textStyle:  const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff2D2D2D),
                ),
              ),
                overflow:TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  prefixIcon3!,
                  const SizedBox(width: 8,),
                  Text(text3!, style: GoogleFonts.raleway(
                    textStyle:  const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2D2D2D),
                    ),
                  ),
                    overflow:TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
