import 'package:get/get.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/routes/bindings/app_binding.dart';
import 'package:tinnierenee12/routes/bindings/auth_binding.dart';
import 'package:tinnierenee12/screen/app_navigation_screen/navigation_screen.dart';
import 'package:tinnierenee12/screen/auth/create_your_password_screen/create_your_password_screen.dart';
import 'package:tinnierenee12/screen/auth/forget_pass_screen/forget_pass_screen.dart';
import 'package:tinnierenee12/screen/auth/location_screen/location_screen.dart';
import 'package:tinnierenee12/screen/auth/personal_info_screen/personal_info_screen.dart';
import 'package:tinnierenee12/screen/auth/sign_in_screen/sign_in_screen.dart';
import 'package:tinnierenee12/screen/auth/sign_up_screen/sign_up_screen.dart';
import 'package:tinnierenee12/screen/auth/verify_otp_screen/verify_otp_screen.dart';
import 'package:tinnierenee12/screen/notification_screen/notification_screen.dart';
import 'package:tinnierenee12/screen/privicy_screen/privicy_screen.dart';
import 'package:tinnierenee12/screen/profile_section/chnage_pass_screen/change_pass_screen.dart';
import 'package:tinnierenee12/screen/profile_section/contact_us_screen/contact_us_screen.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/profile_screen.dart';
import 'package:tinnierenee12/screen/terms_screen/terms_screen.dart';

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
    name: AppRoutes.instance.navigationScreen,
    binding: AppBinding(),
    page: () => const NavigationScreen(),
  ),
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
  GetPage(
    name: AppRoutes.instance.personalInfoScreen,
    binding: AppBinding(),
    page: () => const PersonalInfoScreen(),
  ),

  ///////////////////////////////base screen//////////////////////////
  ///
  GetPage(
    name: AppRoutes.instance.notification,
    binding: AppBinding(),
    page: () => const NotificationScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.profileScreen,
    // binding: AppBinding(),
    page: () => const ProfileScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.termsCondiScreen,
    // binding: AppBinding(),
    page: () => const TermsScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.privicyScreen,
    // binding: AppBinding(),
    page: () => const PrivicyScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.changePassScreen,
    // binding: AppBinding(),
    page: () => const ChangePassScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.contactUsScreen,
    // binding: AppBinding(),
    page: () => const ContactUsScreen(),
  ),
];
