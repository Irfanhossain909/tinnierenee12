// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:loyalty_customer/const/app_color.dart';
// import 'package:loyalty_customer/const/assets_icons_path.dart';
// import 'package:loyalty_customer/routes/app_routes.dart';
// import 'package:loyalty_customer/utils/app_size.dart';
// import 'package:loyalty_customer/widget/app_button/app_button.dart';
// import 'package:loyalty_customer/widget/app_image/app_image.dart';
// import 'package:loyalty_customer/widget/app_input/app_input_widget_two.dart';
// import 'package:loyalty_customer/widget/app_log/gap.dart';
// import 'package:loyalty_customer/widget/app_text/app_text.dart';

// class ForgetPassScreen extends StatelessWidget {
//   const ForgetPassScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.surfacePrimaryLight,
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               AppImage(path: AssetsPath.backgroundImage),

//               Positioned(
//                 top: AppSize.size.height * 0.07,
//                 left: 0,
//                 right: 0, // Ensure that it's horizontally centered
//                 child: Center(
//                   // Center the text horizontally
//                   child: AppImage(
//                     width: AppSize.width(value: 230),
//                     height: AppSize.width(value: 230),
//                     path: AssetsPath.authImg3,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Gap(height: AppSize.width(value: 30)),
//           Padding(
//             padding: EdgeInsets.all(AppSize.width(value: 12)),

//             child: Column(
//               spacing: AppSize.size.height * 0.03,
//               children: [
//                 AppText(
//                   data: "Forgot Your Password?",
//                   fontSize: AppSize.width(value: 30),
//                   fontWeight: FontWeight.w700,
//                   color: AppColor.button4Dark,
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: AppSize.width(value: 20),
//                   ),
//                   child: AppText(
//                     data:
//                         "No worries! Enter your email address below and we'll send you a link to reset your password.",
//                     textAlign: TextAlign.center,
//                     fontSize: AppSize.width(value: 16),
//                     fontWeight: FontWeight.w400,
//                     color: AppColor.button4Dark,
//                   ),
//                 ),
//                 AppInputWidgetTwo(
//                   prefix: Icon(Icons.email_outlined, color: Colors.grey),
//                   borderRadius: 30,
//                   hintText: "example@email.com",
//                 ),
//                 AppButton(
//                   onTap: () {
//                     Get.toNamed(AppRoutes.instance.verifyOtpScreen);
//                   },
//                   title: "Get Verification Code",
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
