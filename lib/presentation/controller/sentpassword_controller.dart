import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SentPasswordController extends GetxController{

  final password = TextEditingController();
  final passwordConfirm = TextEditingController();
  final hidePassword = false.obs;
  final hideConfirmPassword = false.obs;

}