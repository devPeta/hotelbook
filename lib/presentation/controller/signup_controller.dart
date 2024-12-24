import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController{

  ///Variables
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
}