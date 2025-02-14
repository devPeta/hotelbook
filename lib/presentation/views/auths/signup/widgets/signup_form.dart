import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/validator/validator.dart';
import 'package:bookhotel/presentation/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookhotel/core/common/apptextfield.dart';
import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.height,
  });

  final double height;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Name Fields
          Row(
            children: [
              Expanded(
                child: AppKTextField(
                  labelText: 'First name',
                  hintText: 'First name',
                  prefixIcon: const Icon(Icons.person_2_outlined, color: Color(0xff2D2D2D)),
                  controller: controller.firstNameController,
                  validator: (value) => Validator.validateEmptyText('First Name', value),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppKTextField(
                  labelText: 'Last name',
                  hintText: 'Last name',
                  validator: (value) => Validator.validateEmptyText('Last Name', value),
                  controller: controller.lastNameController,
                  prefixIcon: const Icon(Icons.person_2_outlined, color: Color(0xff2D2D2D)),
                ),
              ),
            ],
          ),
          SizedBox(height: widget.height * 0.01),

          /// Username
          AppKTextField(
            labelText: 'Username',
            hintText: 'Username',
            prefixIcon: const Icon(Icons.manage_accounts_outlined, color: Color(0xff2D2D2D)),
            controller: controller.userNameController,
            validator: (value) => Validator.validateEmptyText('User name', value),
          ),
          SizedBox(height: widget.height * 0.01),

          /// Email
          AppKTextField(
            labelText: 'Email',
            validator: (value) => Validator.validateEmail(value),
            hintText: 'Input',
            controller: controller.emailController,
            prefixIcon: const Icon(Icons.email_outlined, color: Color(0xff2D2D2D)),
          ),
          SizedBox(height: widget.height * 0.01),

          /// Phone Number
          AppKTextField(
            labelText: 'Phone number',
            hintText: 'Input',
            controller: controller.phoneNumberController,
            validator: (value) => Validator.validatePhoneNumber(value),
            prefixIcon: const Icon(Icons.phone, color: Color(0xff2D2D2D)),
            keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: true),
          ),
          SizedBox(height: widget.height * 0.01),

          /// Password
          Obx(() => AppKTextField(
            labelText: 'Password',
            hintText: 'Password',
            controller: controller.passwordController,
            validator: (value) => Validator.validatePassword(value),
            prefixIcon: const Icon(Icons.lock_outline, color: Color(0xff2D2D2D)),
            keyboardType: TextInputType.visiblePassword,
            obscureText: controller.hidePassword.value,
            suffixIcon: IconButton(
              icon: Icon(
                controller.hidePassword.value ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xff2D2D2D),
              ),
              onPressed: () => controller.hidePassword.toggle(),
            ),
          )),
          SizedBox(height: widget.height * 0.01),

          /// Submit Button
          AppKButton(
            label: 'Create',
            onTap: controller.registerUser,
            width: double.infinity,
            color: const Color(0xff2D2D2D),
            shadowOpacity: 0.2,
            height: 51,
          ),
        ],
      ),
    );
  }
}