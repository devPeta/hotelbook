import 'package:bookhotel/admin/admin_login.dart';
import 'package:bookhotel/core/common/appsocialbutton.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:bookhotel/presentation/views/app_navigator.dart';
import 'package:bookhotel/presentation/views/auths/login/widgets/login_form.dart';
import 'package:bookhotel/presentation/views/auths/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'widgets/dont_have_an_account.dart';

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
                SizedBox(height: height * 0.03),
                Center(
                  child: Text(
                    'Sign In',
                    style: AppTextStyles.onBoardingTitle.copyWith(
                      color: const Color(0xff2D2D2D),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),

                /// Login Form And Button
                const LoginForm(),
                SizedBox(height: height * 0.02),

                /// Social Button
                const AppKSocialButtons(),
                SizedBox(height: height * 0.01),

                /// Don't have an account Button
                const DontHaveAnAccountLog().animate().fadeIn().scale().move(
                      delay: 100.ms,
                      duration: 600.ms,
                      begin: const Offset(0, 200),
                    ),

                /// For Admin
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end, // Moves to the bottom
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(const AdminLoginScreen());
                        },
                        child:Text('For Admin', style: AppTextStyles.onBoardingTitle.copyWith(
                      color: const Color(0xff2D2D2D),
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
