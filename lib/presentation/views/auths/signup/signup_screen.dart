import 'package:bookhotel/presentation/views/auths/signup/widgets/dont_have_an_account.dart';
import 'package:bookhotel/presentation/views/auths/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:bookhotel/core/common/appsocialbutton.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
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

              ///Sign Up Form And Button
              SignUpForm(height: height),

              SizedBox(height: height * 0.02,),
              ///Social Button
              const AppKSocialButtons(),
              SizedBox(height: height * 0.01,),

              ///Don't have an accountButton
              const DontHaveAnAccount().animate().fadeIn().scale().move(
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





