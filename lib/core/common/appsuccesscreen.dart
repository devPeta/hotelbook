import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:flutter/material.dart';
class SuccessScreen extends StatelessWidget {
  final VoidCallback onPressed;
  const SuccessScreen({Key? key,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.verified_outlined, color: Color(0xFF1fd655), size: 48,),
                const SizedBox(height: 8,),
                Text('Your account successfully created!', style:  AppTextStyles.onBoardingTitle.copyWith(
                    color: const Color(0xff2D2D2D),
                    fontSize: 20,
                    fontWeight: FontWeight.w900
                ),
                ),
                const SizedBox(height: 4,),
                Text('your account has been successfully created, unleash the joy of seamless delivery online.',
                  style: AppTextStyles.onBoardingTitle.copyWith(
                      color: const Color(0xff2D2D2D),
                      fontSize: 16,
                      fontWeight: FontWeight.w900
                  ),),
                const SizedBox(height: 4,),
                SizedBox(
                  width: double.infinity,
                  child: AppKButton(
                    onTap: onPressed,
                   label: 'Continue',
                    height: 41,
                    color: const Color(0xff2D2D2D),
                    shadowOpacity: 0.2,
                  ),
                ),
                const SizedBox(height: 4,),
                SizedBox(
                  width: double.infinity,
                  child: AppKButton(
                    onTap: onPressed,
                    label: 'Resend',
                    color: const Color(0xff2D2D2D),
                    shadowOpacity: 0.2,
                    textStyle:  const TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
