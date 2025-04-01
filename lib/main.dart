import 'package:bookhotel/core/theme/theme.dart';
import 'package:bookhotel/data/models/favourite_provider.dart';
import 'package:bookhotel/presentation/controller/hotel_product_controller.dart';
import 'package:bookhotel/presentation/controller/favourite_controller.dart';
import 'package:bookhotel/presentation/views/auths/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  /// Ensure widgets binding before async operations
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize GetStorage
  await GetStorage.init();


  /// Lock device orientation to portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Initialize Firebase only if not already initialized
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  /// Run the app after initialization is complete
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FavouriteProvider()),
    ],
    child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Initializing Controllers using lazy loading to optimize memory
    Get.lazyPut(() => HotelProductController());
    Get.lazyPut(() => FavouriteController());

    return GetMaterialApp(
      title: 'Book Hotel',
      debugShowCheckedModeBanner: false,
      theme: TTheme.appTheme,
      home: const Wrapper(),
    );
  }
}
