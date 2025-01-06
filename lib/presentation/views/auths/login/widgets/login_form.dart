
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/apptextbutton.dart';
import 'package:bookhotel/core/common/apptextfield.dart';
import 'package:bookhotel/core/validator/validator.dart';
import 'package:bookhotel/presentation/views/auths/forgetpassword/forgetpassword_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/signin_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController(), permanent: true);
    double height = MediaQuery.of(context).size.height;
    return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///TextField
            AppKTextField(
              labelText: 'Email',
              hintText: 'devpeta34@gmail.com',
              prefixIcon: const Icon(Icons.email_outlined, color: Color(0xff2D2D2D),
              ),
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: height * 0.01,),

            ///TextField
            Obx(
                  ()=> AppKTextField(
                    labelText: 'Set Password',
                    hintText: '*******',
                    controller: controller.password,
                    validator: (value) =>  Validator.validateEmptyText('Password',value),
                    prefixIcon: const Icon(Icons.lock_outline, color: Color(0xff2D2D2D),
              ),
                  suffixIcon: IconButton(onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ?     Icons.visibility_off_outlined : Icons.visibility_outlined, color: const Color(0xff2D2D2D),)),
              keyboardType: TextInputType.visiblePassword,
            ),
            ),
            SizedBox(height: height * 0.01,),

            ///Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                            ()=> Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value =! controller.rememberMe.value)
                    ),
                    Text('Remember Me',  style: GoogleFonts.raleway(
                      color: const Color(0xff6B6B6B),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    ),
                  ],
                ),
                AppKTextButton(
                  onPressed: (){
                    Get.to(const ForgetPasswordScreen(),);
                  },
                  text: 'Forgot Password?',
                ),
              ],
            ).animate().fadeIn().scale().move(
              delay: 100.ms,
              duration: 300.ms,
              begin: const Offset(0, 200),
            ),

            AppKButton(
                label: 'Log in',
                width: double.infinity,
                color: const Color(0xff2D2D2D),
                shadowOpacity: 0.2,
                height: 51,
                onTap: () => controller.emailAndPasswordSignIn,
            ),
          ],
        )
    );
  }
}
