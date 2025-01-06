import 'package:bookhotel/core/theme/theme.dart';
import 'package:bookhotel/data/authentication/authentication_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'presentation/views/auths/onboarding/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get_storage/get_storage.dart';


Future<void> main() async {

  runApp(const MyApp());


  ///Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ///Get Storage
  await GetStorage.init();

  ///Cant switch to land space just portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  ///Initialize Firebase And Checking If Users Is Login, Log Out or Restart
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value)=>Get.put(AuthenticationRepository()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Book Hotel',
      debugShowCheckedModeBanner: false,
      theme: TTheme.appTheme,
      home: const OnBoardingScreen(),
    );
  }
}
