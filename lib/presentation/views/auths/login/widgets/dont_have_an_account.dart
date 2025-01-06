import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/appsocialbutton.dart';
import 'package:bookhotel/core/common/apptextbutton.dart';
import 'package:bookhotel/core/common/apptextfield.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:bookhotel/presentation/views/app_navigator.dart';
import 'package:bookhotel/presentation/views/auths/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';



class DontHaveAnAccountLog extends StatelessWidget {
  const DontHaveAnAccountLog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account yet?', style: AppTextStyles.orLogIn.copyWith(
          color: const Color(0xff2D2D2D),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        ),
        const SizedBox(width: 8,),

        TextButton(onPressed: (){
          Get.to(const SignupScreen());
        },
            child: Text(' Sign up',style: AppTextStyles.orLogIn.copyWith(
              color: const Color(0xff2D2D2D),
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
            ))
      ],
    );
  }
}