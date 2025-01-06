import 'package:bookhotel/presentation/views/auths/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:get/get.dart';








class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}