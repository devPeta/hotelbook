import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/constant/images_constant.dart';
import 'package:bookhotel/core/constant/sizes_constant.dart';
import 'package:flutter/material.dart';
import '../../presentation/controller/signin_controller.dart';

class AppKSocialButtons extends StatelessWidget {
  const AppKSocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppKButton(
            height: 54,
            width: 98,
            borderRadius: 4,
            color: Colors.white,
            label: '',
            imgPaths: AppImages.facebook,
            onTap: (){},
            border: Border.all(
              color: const Color(0xffABABAB),
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        const SizedBox(width: AppSizes.spaceBtwItemsMd),
        Expanded(
          child: AppKButton(
            height: 54,
            width: 98,
            borderRadius: 4,
            border: Border.all(
              color: const Color(0xffABABAB),
              width: 1,
              style: BorderStyle.solid,
            ),
            color: Colors.white,
            label: '',
            imgPaths: AppImages.google, // Path to your Google image
            onTap: () async {
              await SignInController.instance.googleSignIn();
            },
          ),
        ),
      ],
    );
  }
}
