import 'package:bookhotel/core/common/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('Verify your email address!', style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                    fontSize: 22,
                    color: Color(0xff2D2D2D),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ),
                const SizedBox(height: 8,),
                Text('yakubupeta@gmail.com', style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Color(0xff2D2D2D),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ),
                const SizedBox(height: 16,),
                Text('Congratulations! Your account awaits: Verify Your Email to Start Booking and Experience a World of Unrivaled Deals and Personalized Offers ',
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                softWrap: true,
                ),
                const SizedBox(height: 8,),

                SizedBox(
                  width: double.infinity,
                  child: AppKButton(
                    label: 'Continue',
                    width: double.infinity,
                    color: const Color(0xff2D2D2D),
                    shadowOpacity: 0.2,
                    height: 51,
                    onTap: (){},
                  ),
                ),
                const SizedBox(height: 4,),
                TextButton(
                  onPressed: (){},
                    child: Text('Resend', style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ),
                )
              ],
            ),
          )
      ),
    );
  }
}
