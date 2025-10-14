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
  static String readNotification = "/notification";

  ///////////////////////other /////////////////////
  static String profile = "/user/profile";
  static String profileUpdate = "/user";
  static String notification(var page) =>
      "/notification/all?page=$page";

  //////////////////job /////////////////
  static String job = "/job/post";
  static String statistic = "/statistic/stats";

  static String jobCategory(var status, var page, var limit) =>
      "/job/post?status=$status&page=$page&limit=$limit";
  static String jobbookedComplate(var page, var limit) =>
      "/applier/booked-and-completed?limit=$limit&page=$page";
  static String jobSubstitute(var page, var limit) =>
      "/job/subtitute-shift?page=$page&limit=$limit";
  static String jobApplier(var jobId, var page, var limit) =>
      "/applier/$jobId?page=$page&limit=$limit";
  static String substituteAcceptReject(var empId) => "/applier/status/$empId";
  static String termsPrivacyAboutUs(var status) => "/rule/$status";
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
