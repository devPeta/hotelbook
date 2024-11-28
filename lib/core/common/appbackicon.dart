import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppKBackIcon extends StatelessWidget {
  const AppKBackIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
      Get.back();
    },
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color: Colors.transparent,
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
        child: const Center(
          child: Icon(Icons.navigate_before, size: 14,),
        ),
      ),
    );
  }
}

