import 'package:flutter/material.dart';

class AppUtilities{

  static double getKeyboardHeight(BuildContext context){
  final viewInsets = View.of(context).viewInsets;
  return viewInsets.bottom;
  }

  static double getAppBarHeight(){
  return kToolbarHeight;
  }

  static double getBottomNavigationBarHeight(){
  return kBottomNavigationBarHeight;
  }

  static double getStatusBarHeight(BuildContext context){
  return MediaQuery.of(context).padding.top;
  }

}