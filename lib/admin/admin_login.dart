import 'package:bookhotel/admin/widgets/admin_login_form.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:bookhotel/presentation/views/auths/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';


class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

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
                    'Admin Sign In',
                    style: AppTextStyles.onBoardingTitle.copyWith(
                      color: const Color(0xff2D2D2D),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),

                /// Login Form And Button
                const AdminLoginForm(),
                SizedBox(height: height * 0.02),



                /// For Admin
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('For User'),
                      TextButton(
                        onPressed: () {
                          Get.to(LoginScreen(),);
                        },
                        child: const Text('Login Here'),
                      ).animate().fadeIn().scale().move(
                      delay: 100.ms,
                      duration: 600.ms,
                      begin: const Offset(0, 200),
                    ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}