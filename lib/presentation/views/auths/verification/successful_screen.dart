import 'package:bookhotel/core/common/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [

                  Text('Your account successfully created!', style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      fontSize: 22,
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ),
                  const SizedBox(height: 8,),
                  Text('Congratulations! Your account has been created: Unleash the joy of seamless online booking ',
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    softWrap: true,
                  ),
                  const SizedBox(height: 16,),

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

                ],
              ),
            ),
          )
      ),
    );
  }
}
