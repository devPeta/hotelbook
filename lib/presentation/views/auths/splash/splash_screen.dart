import 'dart:async';
import 'package:bookhotel/presentation/views/auths/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  bool _showAppName = false;

  @override
  void initState() {
    super.initState();
    // Delay of 1 second before showing the app name
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showAppName = true; // Trigger the fade-in
      });
    });

    // After the splash screen, initialize the next process
    Timer(const Duration(seconds: 5), () {
      Get.to( const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Splash logo in the center
            const Icon(Icons.hotel_outlined, size: 181,),

            // Animated fade-in of the app name
            Positioned(
              bottom: 100, // Adjust this value based on the layout
              child: AnimatedOpacity(
                opacity: _showAppName ? 1.0 : 0.0, // Fade-in effect
                duration: const Duration(seconds: 1), // Duration of the fade-in
                child: const Text(
                  'Book Me',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2D2D2D),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
