class AppRoutes {
  AppRoutes._privateConstructor();
  static final AppRoutes _instance = AppRoutes._privateConstructor();
  static AppRoutes get instance => _instance;
  /////////////  initial or splash screen
  final String initial = "/";
  final String roleSelectionScreen = "/role-selection-screen";
  final String onBoardingScreen1 = "/onboarding-screen1";
  final String navigationScreen = "/navigation-screen";
  ///////////////////////////Auth/////////////////////////////////
  final String signInScreen = "/sign-in-screen";
  final String forgetPassScreen = "/forget-pass-screen";
  final String createNewScreen = "/create-new-screen";
  final String verifyOtpScreen = "/verify-otp-screen";
  final String signUpScreen = "/sign-up-screen";
  final String locationScreen = "/location-screen";
  final String personalInfoScreen = "/personal-info-screen";

  //////////////////////Profile Screen/////////////////////////
  final String notification = "/notification-screen";
  final String profileScreen = "/profile-screen";
  final String termsCondiScreen = "/terms-condi-screen";
  final String privicyScreen = "/privicy-screen";
  final String changePassScreen = "/change-pass-screen";
  final String contactUsScreen = "/contact-us-screen";
  final String changeProfileScreen = "/change-profile-screen";
  //////////////////////Home Screen/////////////////////////
  final String employeeHome = "/employee-home-screen";
  //////////////////////shift Screen/////////////////////////
  final String employeeShiftScreen = "/employee-shift-screen";
  final String employeeShiftDetailsScreen = "/employee-shift-details-screen";
}
