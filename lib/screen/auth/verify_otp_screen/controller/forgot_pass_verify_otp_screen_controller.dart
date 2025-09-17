

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:loyalty_customer/widget/app_log/app_snack_bar.dart';


// class VerifyOtpController extends GetxController {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   TextEditingController otpTextEditingController = TextEditingController();

//   RxInt remainingSeconds = 180.obs; // 3 minutes in seconds
//   var canResend = false.obs;
//   late String email;
//   late Timer _timer;

//   @override
//   void onInit() {
//     super.onInit();
//     startTimer();
//     if (Get.arguments is Map<String, dynamic>) {
//       final args = Get.arguments as Map<String, dynamic>;
//       email = args['email'] ?? '';
//     } else {
//       email = '';
//     }
//   }

//   void startTimer() {
//     // This will keep the timer going in the background
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (remainingSeconds.value > 0) {
//         remainingSeconds.value--;
//       } else {
//         // Timer has completed
//         canResend.value = true;
//         _timer.cancel();
//       }
//     });
//   }

//   void resetTimer() {
//     remainingSeconds.value = 180; // Reset the timer back to 180 seconds
//     canResend.value = false; // Disable the resend button
//     startTimer(); // Restart the timer
//   }

//   String formatTime() {
//     final minutes = remainingSeconds.value ~/ 60;
//     final remainingSec = remainingSeconds.value % 60;
//     return '${minutes.toString().padLeft(2, '0')}:${remainingSec.toString().padLeft(2, '0')}';
//   }

//   /// Resend the OTP code
//   void resendCode() async {
//     try {
//       bool isSuccess = true; // Assume success for now
//       if (isSuccess) {
//         AppSnackBar.success("A new OTP has been sent to your email.");
//         resetTimer(); // Reset the timer after sending the OTP
//       }
//     } catch (e) {
//       AppSnackBar.error("An error occurred. Please try again.");
//     }
//   }
// }


// // class VerifyOtpController extends GetxController {
// //   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

// //   TextEditingController otpTextEditingController = TextEditingController();


// //   RxInt remainingSeconds = 180.obs; // 2.5 minutes
// //   var canResend = false.obs;
// //   late String email;
// //   late Timer _timer;

// //   @override
// //   void onInit() {
// //     super.onInit();
// //     startTimer();
// //     if (Get.arguments is Map<String, dynamic>) {
// //       final args = Get.arguments as Map<String, dynamic>;
// //       email = args['email'] ?? '';
// //     } else {
// //       // Handle the error or provide a default value
// //       email = '';
// //     }
// //   }

// //  /* @override
// //   void onClose() {
// //     _timer.cancel();
// //     otpTextEditingController.dispose();
// //     super.onClose();
// //   }
// // */
// //   void startTimer() {
// //     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
// //       if (remainingSeconds.value > 0) {
// //         remainingSeconds.value--;
// //         /*print(
// //             "Timer: ${remainingSeconds.value} seconds remaining");*/ // Debugging
// //       } else {
// //         canResend.value = true;
// //         AppPrint.appLog("Timer completed. You can resend the code now."); // Debugging
// //         _timer.cancel();
// //       }
// //     });
// //   }

// //   /// Resent Otp code
// //   void resendCode() async {
// //     try {
// //       bool isSuccess = /*await AuthRepository().resendOtp(email: email);*/   true;
// //       if (isSuccess) {
// //         AppSnackBar.success("A new OTP has been sent to your email.");
// //         remainingSeconds.value = 180; // Reset the timer
// //         canResend.value = false;
// //         startTimer(); // Restart the timer
// //       } 
// //     } catch (e) {
// //       AppSnackBar.error("An error occurred. Please try again.");
// //     }
// //   }

// //   String formatTime() {
// //     final minutes = remainingSeconds.value ~/ 60;
// //     final remainingSec = remainingSeconds.value % 60;
// //     return '${minutes.toString().padLeft(2, '0')}:${remainingSec.toString().padLeft(2, '0')}';
// //   }


// //   /// OnTap Button
// //   // Future<void> onTapForgotPassVerifyButton() async {
// //   //   if (formKey.currentState!.validate()) {
// //   //     try {
// //   //       String otp = otpTextEditingController.text.trim();
// //   //
// //   //       // VerifyOtpModel verifyOtpModel = VerifyOtpModel(
// //   //       //   email: email,
// //   //       //   otp: otp,
// //   //       // );
// //   //       var response = await _verifyOtpController.verifyOtp(
// //   //           verifyOtpModel: verifyOtpModel, url: ApiUrls.verifyEmail);
// //   //
// //   //       appLog("response ==> $response");
// //   //
// //   //       if (response != null && response["data"] != null) {
// //   //         String token = response["data"]?["resetToken"];
// //   //
// //   //         AppSnackBar.success('${_verifyOtpController.successfullyMessage}');
// //   //         appLog(
// //   //             'success message => ${_verifyOtpController.successfullyMessage}');
// //   //
// //   //         AppSnackBar.success("Verification Successful");
// //   //         Get.offAllNamed(
// //   //           AppRoutes.resetPasswordScreen,
// //   //           arguments: {'token': token},
// //   //         );
// //   //       } else {
// //   //         AppSnackBar.message('${_verifyOtpController.errorMessage}');
// //   //         appLog('error message => ${_verifyOtpController.errorMessage}');
// //   //       }
// //   //     } catch (e) {
// //   //       AppSnackBar.message('${_verifyOtpController.errorMessage}');
// //   //     }
// //   //   } else {
// //   //     AppSnackBar.error("Please fill in all required fields.");
// //   //   }
// //   // }

// // }
