import 'package:flutter/foundation.dart';
import 'package:tinnierenee12/widget/app_log/error_log.dart';

class AppApiEndPoint {
  AppApiEndPoint._privateConstructor();
  static final AppApiEndPoint _instance = AppApiEndPoint._privateConstructor();
  static AppApiEndPoint get instance => _instance;

  //app use base
  static final String domain = _getDomain();
  final String baseUrl = "$domain/api/v1";

  //////////////////  Auth /////////////////////
  static String login = "/auth/login";
  static String signup = "/user";
  static String verifyEmail = "/auth/verify-email";
  static String forgotPassword = "/auth/forgot-password";
  static String changePassword = "/auth/change-password";
  static String resetPassword = "/auth/reset-password";
  static String resendOtp = "/auth/resend-otp";
  static String deleteAccount = "/auth/delete-account";

  ///////////////////////other /////////////////////
  static String profile = "/user/profile";
  static String profileUpdate = "/user";

  //////////////////job /////////////////
  static String job = "/job/posts";

  // static String getMessage(var page, var limit ,String iD) => "/message/$iD?page=$page&limit=$limit";
  // static String search(var text,) => "/wcservice?search=$text";
  // final String specificCategoryService = "/service/";
}

// Move this function outside the class
String _getDomain() {
  String liveServer = "http://10.10.7.46:5003";
  String localServer = "http://10.10.7.46:5003";
  try {
    if (kDebugMode) {
      return localServer;
    }
    return liveServer;
  } catch (e) {
    errorLog("_getDomain", e);
    return liveServer;
  }
  // return liveServer;
}
