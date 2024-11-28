import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AppIconPop extends StatelessWidget {
  const AppIconPop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Color(0xffBDBABA),
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(-2, 2),
              ),
            ]
        ),
        child: Center(
          child: Icon(Icons.navigate_before, size: 14,
                color: const Color(0xffBDBABA).withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
