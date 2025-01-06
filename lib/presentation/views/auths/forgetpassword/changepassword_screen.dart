import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/apptextfield.dart';
import 'package:bookhotel/presentation/controller/forgetpassword_controller.dart';
import 'package:bookhotel/presentation/views/auths/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class SentScreen extends StatelessWidget {
  const SentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [

                  Text('Change Password?', style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      fontSize: 22,
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ),
                  const SizedBox(height: 8,),
                  Text('Enter your new password!',
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
                  const AppKTextField(
                    labelText: 'New Password',
                    hintText: 'Enter your new password',
                    prefixIcon: Icon(Icons.lock_outline, color: Color(0xff2D2D2D),
                    ),
                    suffixIcon: IconButton(onPressed: null,
                      icon:Icon(Icons.visibility_off_outlined),),
                    ),
                  const SizedBox(height: 8,),
                  const AppKTextField(
                    labelText: 'Confirm Password',
                    hintText: 'Enter your new password',
                    prefixIcon: Icon(Icons.lock_outline, color: Color(0xff2D2D2D),
                    ),
                    suffixIcon: IconButton(onPressed: null,
                      icon:Icon(Icons.visibility_off_outlined),),
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
                      onTap: ()=> Get.offAll(()=> const LoginScreen()),
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: AppKButton(
                      label: 'Resend mail',
                      width: double.infinity,
                      color: const Color(0xffffffff),
                      textStyle: const TextStyle(
                        color:  Color(0xff2D2D2D),
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      shadowOpacity: 0.2,
                      height: 51,
                      onTap: ()=> ForgetPasswordController.instance.resendPasswordResetEmail,
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
