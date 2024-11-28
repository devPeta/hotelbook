import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/appsocialbutton.dart';
import 'package:bookhotel/core/common/apptextbutton.dart';
import 'package:bookhotel/core/common/apptextfield.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:bookhotel/core/theme/custom_theme/theme_textfield.dart';
import 'package:bookhotel/presentation/views/app_navigator.dart';
import 'package:bookhotel/presentation/views/auths/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.03,),
                Center(
                  child: Text('Sign In', style: AppTextStyles.onBoardingTitle.copyWith(
                    color: const Color(0xff2D2D2D),
                    fontSize: 20,
                    fontWeight: FontWeight.w900
                  ),
                  ),
                ),
                SizedBox(height: height * 0.02,),

                ///Login Form
              Form(
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            ///TextField
                            const AppKTextField(
                              labelText: 'Email',
                              hintText: 'devpeta34@gmail.com',
                              prefixIcon: Icon(Icons.email_outlined, color: Color(0xff2D2D2D),
                              ),
                            ),
                            SizedBox(height: height * 0.01,),

                            ///TextField
                            const AppKTextField(
                              labelText: 'Set Password',
                              hintText: '*******',
                              prefixIcon: Icon(Icons.key_rounded, color: Color(0xff2D2D2D),
                              ),
                            ),
                            SizedBox(height: height * 0.01,),
                          ],
                        )
                ),
                SizedBox(height: height * 0.01,),

                ///Forget Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppKTextButton(
                      onPressed: (){
                      },
                      text: 'Forgot Password?',
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01,),

                ///Login Button
                AppKButton(
                  label: 'Log in',
                  width: double.infinity,
                  color: const Color(0xff2D2D2D),
                  shadowOpacity: 0.2,
                  height: 51,
                  onTap: (){
                    Get.to(const AppNavigator());
                  },
                ),

                ///Divider
                // Row(
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

                ///Dont have an accountButton
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account yet?', style: AppTextStyles.orLogIn.copyWith(
                    color: const Color(0xff2D2D2D),
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                         ),
                    ),
                    const SizedBox(width: 4,),

                    TextButton(onPressed: (){
                      Get.to(const SignupScreen());
                    },
                        child: Text(' Sign up',style: AppTextStyles.orLogIn.copyWith(
                          color: const Color(0xff2D2D2D),
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                        ))
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}
