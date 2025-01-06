import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/validator/validator.dart';
import 'package:bookhotel/presentation/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookhotel/core/common/apptextfield.dart';
import 'package:get/get.dart';


class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///Name TextField
           Row(
              children: [
                Expanded(
                  child: AppKTextField(
                    labelText: 'First name',
                    hintText: 'First name',
                    prefixIcon: const Icon(Icons.person_2_outlined, color: Color(0xff2D2D2D),
                    ),
                    controller: controller.firstName,
                    validator: (value) => Validator.validateEmptyText('First Name', value),
                  ),
                ),
                const SizedBox(width: 16,),
                Expanded(
                  child: AppKTextField(
                    labelText: 'Last name',
                    hintText: 'Last name',
                    validator: (value) => Validator.validateEmptyText('Last Name', value),
                    controller: controller.lastName,
                    prefixIcon: const Icon(Icons.person_2_outlined, color: Color(0xff2D2D2D),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.01,),

            ///Username TextField
              AppKTextField(
              labelText: 'Username',
              hintText: 'Username',
              prefixIcon: const Icon(Icons.manage_accounts_outlined, color: Color(0xff2D2D2D),
              ),
              controller: controller.userName,
              validator: (value) => Validator.validateEmptyText('User name', value),
            ),
            SizedBox(height: height * 0.01,),

            ///Email TextField
            AppKTextField(
              labelText: 'Email',
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              hintText: 'input',
              prefixIcon: const Icon(Icons.email_outlined, color: Color(0xff2D2D2D),
              ),
            ),
            SizedBox(height: height * 0.01,),

            ///Phone TextField
          AppKTextField(
              labelText: 'Phone number',
              hintText: 'input',
              controller: controller.phoneNumber,
              validator: (value) => Validator.validatePhoneNumber(value),
              prefixIcon: const Icon(Icons.phone, color: Color(0xff2D2D2D),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: true),
            ),
            SizedBox(height: height * 0.01,),

            ///Password TextField
            Obx(()=> AppKTextField(
                  labelText: 'Password',
                  hintText: 'Password',
                  controller: controller.password,
                  validator: (value) => Validator.validatePassword(value),
              prefixIcon: const Icon(Icons.lock_outline, color: Color(0xff2D2D2D),
              ),
              suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ?
                  Icons.visibility_off_outlined: Icons.visibility_outlined,)),
                  keyboardType: TextInputType.visiblePassword,
                  ),
            ),
            SizedBox(height: height * 0.01,),

            AppKButton(
                label: 'Create',
                onTap: () => controller.signup(),
                width: double.infinity,
                color: const Color(0xff2D2D2D),
                shadowOpacity: 0.2,
                height: 51,
            ),
          ],
        )
    );
  }
}