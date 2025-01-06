import 'package:bookhotel/presentation/views/auths/forgetpassword/changepassword_screen.dart';
import 'package:bookhotel/presentation/views/auths/forgetpassword/forgetpassword_screen.dart';
import 'package:bookhotel/presentation/views/auths/login/login_screen.dart';
import 'package:bookhotel/presentation/views/auths/onboarding/onboarding_screen.dart';
import 'package:bookhotel/presentation/views/auths/signup/signup_screen.dart';
import 'package:bookhotel/presentation/views/auths/splash/splash_screen.dart';
import 'package:bookhotel/presentation/views/auths/verification/verify_email_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const HOME = '/';
  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding_screen';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const VERIFY_EMAIL = '/verify-email';
  static const CHANGE_PASSWORD = '/change-password';
  static const PROFILE = '/profile';
  static const SETTINGS = '/settings';
  static const NOT_FOUND = '/not-found';


  static const FAVOURITE_PAGE = '/favourite-page';
  static const NOTIFICATIONS_PAGE = '/notifications-page';
  static const SEARCH_PAGE = '/search-page';
  static const SCHEDULE_PAGE = '/schedule_page';

}

final List<GetPage<dynamic>> appRoutes = [
 /// Auth
  GetPage(name: Routes.LOGIN, page: () => const LoginScreen()),
  GetPage(name: Routes.ONBOARDING, page: () => const OnBoardingScreen(),),
  GetPage(name: Routes.SPLASH, page: () => const SplashScreen(),),
  GetPage(name: Routes.FORGOT_PASSWORD, page: () => const ForgetPasswordScreen(),),
  GetPage(name: Routes.VERIFY_EMAIL, page: () => const VerifyEmailScreen(),),
  GetPage(name: Routes.REGISTER, page: () => const SignupScreen(),),
  GetPage(name: Routes.CHANGE_PASSWORD, page: () => const SentScreen(),),


  ///Mavigation Pages

];
