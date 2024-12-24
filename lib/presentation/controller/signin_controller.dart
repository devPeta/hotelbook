import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SignInController extends GetxController{

  ///Variables
  final email = TextEditingController();
  final password = TextEditingController();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

}