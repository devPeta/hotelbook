import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/apptextfield.dart';
import 'package:bookhotel/core/validator/validator.dart';
import 'package:bookhotel/presentation/controller/forgetpassword_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const ApplicationBar(title: 'Forget Password', leadingIcon: null, showBackArrow: false, ),
              const SizedBox(height: 32,),
              Text('Recovered Password?', style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                  fontSize: 22,
                  color: Color(0xff2D2D2D),
                  fontWeight: FontWeight.w700,
                ),
              ),
              ),
              const SizedBox(height: 8,),
              Text('Kindly, provide the following details to recover your account',
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

             Form(
               key: controller.forgetPasswordFormKey,
               child: Column(
                 children: [
                   AppKTextField(
                     controller: controller.email,
                     validator: (value) => Validator.validateEmail(value),
                      labelText: 'Enter your mail',
                      hintText: 'devpxxxx@gmail.com',
                      prefixIcon: const Icon(Icons.mail_outline_outlined, color: Color(0xff2D2D2D),
                      ),
                    ),
                 ],
               ),
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
                  onTap: ()=> controller.sendPasswordResetEmail(),
                ),
              ),
            ],
          ),)),
    );
  }
}
