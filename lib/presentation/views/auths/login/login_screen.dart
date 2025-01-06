import 'package:bookhotel/core/common/appsocialbutton.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:bookhotel/presentation/views/app_navigator.dart';
import 'package:bookhotel/presentation/views/auths/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'widgets/dont_have_an_account.dart';
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
          child: SingleChildScrollView(
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

                  ///Login Form And Button
                  const LoginForm(),
                  SizedBox(height: height * 0.02,),

                  ///Social Button
                  const AppKSocialButtons(),
                  SizedBox(height: height * 0.01,),

                  ///Dont have an accountButton
                  const DontHaveAnAccountLog().animate().fadeIn().scale().move(
                    delay: 100.ms,
                    duration: 600.ms,
                    begin: const Offset(0, 200),
                  ),

                  TextButton(
                    onPressed: ()=> Get.to(AppNavigator()),
                    child: Text('Skip',),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
