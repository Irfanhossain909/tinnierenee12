import 'package:get/get.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/routes/bindings/auth_binding.dart';
import 'package:tinnierenee12/screen/auth/create_your_password_screen/create_your_password_screen.dart';
import 'package:tinnierenee12/screen/auth/forget_pass_screen/forget_pass_screen.dart';
import 'package:tinnierenee12/screen/auth/location_screen/location_screen.dart';
import 'package:tinnierenee12/screen/auth/sign_in_screen/sign_in_screen.dart';
import 'package:tinnierenee12/screen/auth/sign_up_screen/sign_up_screen.dart';
import 'package:tinnierenee12/screen/auth/verify_otp_screen/verify_otp_screen.dart';

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
  GetPage(
    name: AppRoutes.instance.forgetPassScreen,
    // binding: SplashScreenBinding(),
    page: () => const ForgetPassScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.createNewScreen,
    // binding: SplashScreenBinding(),
    page: () => const CreatePasswordScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.verifyOtpScreen,
    // binding: SplashScreenBinding(),
    page: () => const VerifyOtpScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.signUpScreen,
    binding: AuthBinding(),
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.locationScreen,
    // binding: AuthBinding(),
    page: () => const LocationScreen(),
  ),
];
