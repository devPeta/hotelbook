import 'package:bookhotel/core/constant/images_constant.dart';
import 'package:bookhotel/core/constant/textstring_constant.dart';
import 'package:bookhotel/core/constant/textstyle_constant.dart';
import 'package:bookhotel/presentation/views/auths/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bernard-hermant-KqOLr8OiQLU-unsplash 1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                        colors: [ const Color(0xffffffff).withOpacity(0.3), const Color(0xff000000).withOpacity(0.5)],
                        stops: const [0.75, 1.0],
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.1,),
                        ///Text + Animation
                        Animate(
                          effects:const [
                            FadeEffect(
                              duration: Duration(
                                seconds: 1
                              ),
                            ),
                            ScaleEffect(
                              duration: Duration(
                                seconds: 1
                              ),
                            ),
                          ],
                            child: Text(AppString.boardingTitle, style: AppTextStyles.onBoardingTitle,)
                        ),
                        SizedBox(height: height * 0.6,),

                        ///Button + Animation
                        Center(
                          child: GestureDetector(
                            onTap: (){
                              Get.to(const LoginScreen(),
                                transition: Transition.rightToLeftWithFade, // You can try other transitions like zoom, cupertino, etc.
                                duration: const Duration(milliseconds: 500),
                              );
                            },
                            child: Container(
                              height: 70,
                              width: 315,
                              decoration: BoxDecoration(
                                color: const Color(0xff727272),
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                  colors: [Color(0xff2D2D2D), Color(0xff2194FF)],
                                  stops:  [0.95, 1.0],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Center(
                                child:  Text('Get Started', style: AppTextStyles.onBoardingTitle.copyWith(
                                      fontSize: 20, color: const Color(0xffffffff),
                                    )),
                                ),
                              ),
                            ),
                          ).animate().fadeIn().scale().move(
                          delay: 1200.ms,
                          duration: 1200.ms,
                          begin: const Offset(0, 200),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
