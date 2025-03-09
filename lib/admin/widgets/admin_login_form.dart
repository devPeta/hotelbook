import 'package:bookhotel/admin/admin_controller.dart';
import 'package:bookhotel/core/common/appbutton.dart';
import 'package:bookhotel/core/common/apptextfield.dart';
import 'package:bookhotel/core/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginForm extends StatefulWidget {
  const AdminLoginForm({super.key});

  @override
  State<AdminLoginForm> createState() => _AdminLoginFormState();
}

class _AdminLoginFormState extends State<AdminLoginForm> {
  final controller = Get.put(AdminSignInController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Email Field
          AppKTextField(
            labelText: 'Email',
            hintText: 'admin@example.com',
            prefixIcon: const Icon(Icons.email_outlined, color: Color(0xff2D2D2D)),
            controller: controller.emailController,
            validator: (value) => Validator.validateEmail(value),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: height * 0.01),

          /// Password Field
          Obx(
            () => AppKTextField(
              labelText: 'Password',
              hintText: '*******',
              controller: controller.passwordController,
              validator: (value) => Validator.validateEmptyText('Password', value),
              obscureText: controller.hidePassword.value,
              prefixIcon: const Icon(Icons.lock_outline, color: Color(0xff2D2D2D)),
              suffixIcon: IconButton(
                onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                icon: Icon(
                  controller.hidePassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: const Color(0xff2D2D2D),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          SizedBox(height: height * 0.01),

          /// Login Button
          AppKButton(
            label: 'Log in',
            width: double.infinity,
            color: const Color(0xff2D2D2D),
            shadowOpacity: 0.2,
            height: 51,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                controller.loginAdmin();
              }
            },
          ),
        ],
      ),
    );
  }
}
