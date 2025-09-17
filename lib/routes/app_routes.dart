class AppRoutes {
  AppRoutes._privateConstructor();
  static final AppRoutes _instance = AppRoutes._privateConstructor();
  static AppRoutes get instance => _instance;
  /////////////  initial or splash screen
  final String initial = "/";
  final String onBoardingScreen = "/onboarding-screen";
  final String navigationScreen = "/navigation-screen";



  final String signInScreen = "/sign-in-screen";
  final String forgetPassScreen = "/forget-pass-screen";
  final String createNewScreen = "/create-new-screen";
  
}
