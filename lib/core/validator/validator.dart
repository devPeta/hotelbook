import 'package:flutter/material.dart';

class KValidator{

  static String? validateEmptyText(String? fieldName, String? value){
    if (value == null || value.isEmpty){
      return '$fieldName is required.';
    }
    return null;
  }


  static String? validatePhoneNumber(String? value) {
    // Regular expression for phone numbers (this can be adjusted based on requirements)
    String pattern = r'(^[+]*[0-9]{1,4}[ ]?[-0-9 ]{7,14}$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }


  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty){
      return 'Email is required.';
    }
  }
  //Regular expression for email validation
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  //Boolean
  bool isEmailValid(String email) {
    // Regular expression for email validation
    final RegExp regex = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'
    );
    return regex.hasMatch(email);
  }


  static String? validatePassword(String? value){
    if(value == null || value.isEmpty ){
      return 'Password is required.';
    }
    //check for minimum password length
    if(value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    //Check for minimum password length
    if(value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase';
    }
  }
}