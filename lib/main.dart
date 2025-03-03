import 'package:bookhotel/core/theme/theme.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:bookhotel/presentation/views/auths/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'package:bookhotel/presentation/controller/favourite_controller.dart';


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



  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    ///Initializing Product Controller
    Get.put(HotelProductController());
    Get.put(FavouriteController());

    return GetMaterialApp(
      title: 'Book Hotel',
      debugShowCheckedModeBanner: false,
      theme: TTheme.appTheme,
      home: Wrapper(),
    );
  }
}
