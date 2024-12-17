import 'package:bookhotel/presentation/views/auths/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/appsocialbutton.dart';
import 'package:bookhotel/core/common/apptextbutton.dart';
import 'package:bookhotel/core/common/apptextfield.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.01,),
              Center(
                child: Text('Create your Account', style: AppTextStyles.onBoardingTitle.copyWith(
                  color: const Color(0xff2D2D2D),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
                ),
              ),
              SizedBox(height: height * 0.02,),

              ///Sign Up Form
              Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ///Name TextField
                      const Row(
                        children: [
                          Expanded(
                            child: AppKTextField(
                              labelText: 'First name',
                              hintText: 'First name',
                              prefixIcon: Icon(Icons.person_2_outlined, color: Color(0xff2D2D2D),
                              ),
                            ),
                          ),
                          SizedBox(width: 16,),
                          Expanded(
                            child: AppKTextField(
                              labelText: 'Last name',
                              hintText: 'Last name',
                              prefixIcon: Icon(Icons.person_2_outlined, color: Color(0xff2D2D2D),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01,),

                      ///Email TextField
                      const AppKTextField(
                        labelText: 'Username',
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.manage_accounts_outlined, color: Color(0xff2D2D2D),
                        ),
                      ),
                      SizedBox(height: height * 0.01,),

                      ///Email TextField
                      const AppKTextField(
                        labelText: 'Email',
                        hintText: 'input',
                        prefixIcon: Icon(Icons.email_outlined, color: Color(0xff2D2D2D),
                        ),
                      ),
                      SizedBox(height: height * 0.01,),

                      ///Email TextField
                      const AppKTextField(
                        labelText: 'Phone number',
                        hintText: 'input',
                        prefixIcon: Icon(Icons.phone, color: Color(0xff2D2D2D),
                        ),
                      ),
                      SizedBox(height: height * 0.01,),

                      ///Password TextField
                      const AppKTextField(
                        labelText: 'Password',
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.key_rounded, color: Color(0xff2D2D2D),
                        ),
                      ),
                      SizedBox(height: height * 0.01,),

                    ],
                  )
              ),
              SizedBox(height: height * 0.01,),

              ///Login Button
              AppKButton(
                label: 'Create',
                width: double.infinity,
                color: const Color(0xff2D2D2D),
                shadowOpacity: 0.2,
                height: 51,
              ),

              ///Divider
              //    Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     const Divider(),
              //     Text('Or sign up with', style: AppTextStyles.orLogIn,),
              //     const Divider(),
              //   ],
              // ),
              SizedBox(height: height * 0.02,),
              ///Social Button
              const AppKSocialButtons(),
              SizedBox(height: height * 0.01,),

              ///Don't have an accountButton
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account yet?', style: AppTextStyles.orLogIn.copyWith(
                    color: const Color(0xff2D2D2D),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  const SizedBox(width: 4,),

                  TextButton(onPressed: (){
                    Get.to(const LoginScreen());
                  },
                      child: Text(' Login',style: AppTextStyles.orLogIn.copyWith(
                        color: const Color(0xff2D2D2D),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                      ))
                ],
              ).animate().fadeIn().scale().move(
                delay: 100.ms,
                duration: 600.ms,
                begin: const Offset(0, 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
