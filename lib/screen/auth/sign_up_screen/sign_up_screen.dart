// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:loyalty_customer/const/app_color.dart';
// import 'package:loyalty_customer/const/app_const.dart';
// import 'package:loyalty_customer/const/assets_icons_path.dart';
// import 'package:loyalty_customer/routes/app_routes.dart';
// import 'package:loyalty_customer/screen/auth/sign_up_screen/controller/signup_controller.dart';
// import 'package:loyalty_customer/utils/app_size.dart';
// import 'package:loyalty_customer/widget/app_button/app_button.dart';
// import 'package:loyalty_customer/widget/app_image/app_image.dart';
// import 'package:loyalty_customer/widget/app_input/app_input_widget_two.dart';
// import 'package:loyalty_customer/widget/app_log/gap.dart';
// import 'package:loyalty_customer/widget/app_text/app_text.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.surfacePrimaryLight,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 AppImage(path: AssetsPath.backgroundImage),
//                 Positioned(
//                   left: AppSize.width(value: 12),
//                   top:
//                       AppSize.size.height *
//                       0.1, // Ensure that it's horizontally centered
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppText(
//                         data: "Join Miltech Today!",
//                         fontSize: AppSize.width(value: 34),
//                         fontWeight: FontWeight.w700,
//                         color: AppColor.button1Light,
//                       ),
//                       AppText(
//                         data: "Unlock Rewards, Start Earning Now!",
//                         fontSize: AppSize.width(value: 16),
//                         fontWeight: FontWeight.w400,
//                         color: AppColor.button1Light,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: AppSize.size.height * 0.2,
//                   left: 0,
//                   right: 0, // Ensure that it's horizontally centered
//                   child: Center(
//                     // Center the text horizontally
//                     child: AppText(
//                       data: "Logo",
//                       fontSize: AppSize.width(value: 80),
//                       fontWeight: FontWeight.w600,
//                       color: AppColor.button1Light,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Gap(height: AppSize.width(value: 12)),
//             GetBuilder<SignUpController>(
//               init: SignUpController(),
//               builder: (controlller) {
//                 return Padding(
//                   padding: EdgeInsets.all(AppSize.width(value: 12)),

//                   child: Column(
//                     spacing: AppSize.size.height * 0.015,
//                     children: [
//                       AppInputWidgetTwo(
//                         borderRadius: 30,
//                         hintText: "Sabbir Ahmed",
//                       ),
//                       AppInputWidgetTwo(
//                         borderRadius: 30,
//                         hintText: "example@email.com",
//                       ),
//                       AppInputWidgetTwo(
//                         borderRadius: 30,
//                         hintText: "123456789301",
//                       ),
//                       AppInputWidgetTwo(
//                         borderRadius: 30,
//                         hintText: "Country of Residence",
//                         suffixIcon: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: AppImage(
//                             width: AppSize.width(value: 18),
//                             path: AssetsPath.arrowDown,
//                           ),
//                         ),
//                       ),
//                       Gap(height: AppSize.width(value: 12)),
//                       AppButton(
//                         onTap: () {
//                           Get.toNamed(AppRoutes.instance.cteatePasswordScreen);
//                         },
//                         title: "Sign Up",
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       Obx(
//                         () => Row(
//                           children: [
//                             Checkbox(
//                               value: controlller.isChecked.value,
//                               onChanged: (bool? value) {
//                                 controlller.toggleCheckbox(value ?? false);
//                               },
//                             ),
//                             Flexible(
//                               child: AppText(
//                                 data:
//                                     "I agree to (Company Name) Terms & Conditions.",
//                                 fontSize: AppSize.width(value: 12),
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColor.button1Dark,
//                                 textAlign: TextAlign
//                                     .start, // Align the text to the start
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(AppSize.width(value: 12)),
//           child: Row(
//             children: [
//               InkWell(
//                 onTap: () {
//                   Get.toNamed(AppRoutes.instance.termsScreen);
//                 },
//                 child: Text(
//                   "Terms & Conditions",
//                   style: TextStyle(
//                     fontFamily: AppConst.fontFamily1,
//                     fontSize: AppSize.width(value: 12),
//                     fontWeight: FontWeight.w400,
//                     decoration: TextDecoration.underline,
//                     color: AppColor.button1Dark, // Underlines the text
//                     // You can specify style of the underline if needed
//                   ),
//                 ),
//               ),
//               Gap(width: AppSize.width(value: 20)),
//               InkWell(
//                 onTap: () {
//                   Get.toNamed(AppRoutes.instance.privicyScreen);
//                 },
//                 child: Text(
//                   "Privacy Policy",
//                   style: TextStyle(
//                     fontFamily: AppConst.fontFamily1,
//                     fontSize: AppSize.width(value: 12),
//                     fontWeight: FontWeight.w400,
//                     decoration: TextDecoration.underline,
//                     color: AppColor.button1Dark, // Underlines the text
//                     // You can specify style of the underline if needed
//                   ),
//                 ),
//               ),
//               Spacer(),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   AppText(
//                     data: "All Ready Sign Up?",
//                     fontSize: AppSize.width(value: 12),
//                     fontWeight: FontWeight.w700,
//                     color: AppColor.button1Dark,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.offNamed(AppRoutes.instance.signInScreen);
//                     },
//                     child: AppText(
//                       data: "Sign In",
//                       fontSize: AppSize.width(value: 22),
//                       fontWeight: FontWeight.w700,
//                       color: AppColor.button5Dark,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
