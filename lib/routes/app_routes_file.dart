import 'package:get/get.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/screen/auth/sign_in_screen/sign_in_screen.dart';

List<GetPage> appRootRoutesFile = <GetPage>[
  //   /////////////////  splash screen start
  // GetPage(
  //   name: AppRoutes.instance.initial,
  //   binding: SplashScreenBinding(),
  //   page: () => const SplashScreen(),
  //   transitionDuration: Duration(milliseconds: 800),
  //   opaque: false,
  // ),
  GetPage(
    name: AppRoutes.instance.signInScreen,
    // binding: SplashScreenBinding(),
    page: () => const SignInScreen(),
  ),
];
