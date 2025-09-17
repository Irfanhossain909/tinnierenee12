// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
// import 'package:loyalty_customer/const/app_color.dart';
// import 'package:loyalty_customer/const/assets_icons_path.dart';
// import 'package:loyalty_customer/routes/app_routes.dart';
// import 'package:loyalty_customer/screen/auth/verify_otp_screen/controller/forgot_pass_verify_otp_screen_controller.dart';
// import 'package:loyalty_customer/utils/app_size.dart';
// import 'package:loyalty_customer/widget/app_button/app_button.dart';
// import 'package:loyalty_customer/widget/app_image/app_image.dart';
// import 'package:loyalty_customer/widget/app_text/app_text.dart';

// class VerifyOtpScreen extends StatelessWidget {
//   const VerifyOtpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.surfacePrimaryLight,
//       body: GetBuilder<VerifyOtpController>(
//         init: VerifyOtpController(),
//         builder: (controller) {
//           return Column(
//             spacing: AppSize.size.height * 0.02,
//             children: [
//               Stack(
//                 children: [
//                   AppImage(path: AssetsPath.backgroundImage),

//                   Positioned(
//                     top: AppSize.size.height * 0.07,
//                     left: 0,
//                     right: 0, // Ensure that it's horizontally centered
//                     child: Center(
//                       // Center the text horizontally
//                       child: AppImage(
//                         width: AppSize.width(value: 230),
//                         height: AppSize.width(value: 230),
//                         path: AssetsPath.authImg2,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               AppText(
//                 data: "Verification Code",
//                 fontSize: AppSize.width(value: 30),
//                 fontWeight: FontWeight.w700,
//                 color: AppColor.button4Dark,
//               ),

//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: AppSize.width(value: 40),
//                 ),
//                 child: AppText(
//                   data: "Please enter the code sent to your Phone to continue.",
//                   textAlign: TextAlign.center,
//                   fontSize: AppSize.width(value: 16),
//                   fontWeight: FontWeight.w400,
//                   color: AppColor.button4Dark,
//                 ),
//               ),
//               AppText(
//                 data: "We've Sent a Code to 122*******36",
//                 fontSize: AppSize.width(value: 16),
//                 fontWeight: FontWeight.w700,
//                 color: AppColor.button4Dark,
//               ),

//               OtpTextField(
//                 numberOfFields: 5, // Number of OTP fields
//                 borderColor: Color(0xFF512DA8), // Border color of the OTP field
//                 showFieldAsBox:
//                     true, // Show fields as boxes (true for box style)
//                 onCodeChanged: (String code) {
//                   // Handle the code change
//                 },
//                 onSubmit: (String verificationCode) {
//                   // Show the entered verification code in a dialog
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         title: Text("Verification Code"),
//                         content: Text('Code entered is $verificationCode'),
//                       );
//                     },
//                   );
//                 },
//                 decoration: InputDecoration(
//                   filled:
//                       true, // Makes the background color of the text field filled
//                   fillColor: Colors.white, // Background color inside the box
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 15,
//                     vertical: 10,
//                   ), // Padding inside the box
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                       12,
//                     ), // Rounded corners for the box
//                     borderSide: BorderSide(
//                       color: Color(0xFF512DA8), // Border color
//                       width: 2.0, // Border width
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                       12,
//                     ), // Rounded corners when focused
//                     borderSide: BorderSide(
//                       color: Color(0xFF512DA8), // Focused border color
//                       width: 2.0, // Focused border thickness
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                       12,
//                     ), // Rounded corners for the enabled state
//                     borderSide: BorderSide(
//                       color: Color(0xFF512DA8), // Border color when not focused
//                       width: 2.0,
//                     ),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                       12,
//                     ), // Rounded corners for error state
//                     borderSide: BorderSide(
//                       color: Colors.red, // Red border on error
//                       width: 2.0,
//                     ),
//                   ),
//                   focusedErrorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                       12,
//                     ), // Rounded corners on error focus
//                     borderSide: BorderSide(
//                       color: Colors.red, // Red focused error border color
//                       width: 2.0,
//                     ),
//                   ),
//                 ),
//               ),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AppText(
//                     data: 'If you didn’t receive a code. ',
//                     fontSize: AppSize.width(value: 18),
//                   ),
//                   Obx(
//                     () => controller.canResend.value
//                         ? GestureDetector(
//                             onTap: () {
//                               controller.resendCode();
//                             },
//                             child: Text(
//                               'Resend',
//                               style: TextStyle(
//                                 fontSize: AppSize.width(value: 16),
//                                 fontWeight: FontWeight.w700,
//                                 color: AppColor.buttonDark,
//                               ),
//                             ),
//                           )
//                         : Text(
//                             controller.formatTime(),
//                             style: TextStyle(
//                               fontSize: AppSize.width(value: 16),
//                               fontWeight: FontWeight.w700,
//                               color: AppColor.button4Dark,
//                             ),
//                           ),
//                   ),
//                 ],
//               ),

//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: AppSize.width(value: 16),
//                 ),
//                 child: AppButton(
//                   onTap: () {
//                     Get.toNamed(AppRoutes.instance.locationScreen);
//                   },
//                   title: "Verify",
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
