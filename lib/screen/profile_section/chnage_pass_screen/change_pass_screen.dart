// import 'package:flutter/material.dart';
// import 'package:loyalty_customer/const/app_color.dart';
// import 'package:loyalty_customer/const/app_theme_color.dart';
// import 'package:loyalty_customer/const/assets_icons_path.dart';
// import 'package:loyalty_customer/utils/app_size.dart';
// import 'package:loyalty_customer/widget/app_button/app_button.dart';
// import 'package:loyalty_customer/widget/app_image/app_image.dart';
// import 'package:loyalty_customer/widget/app_input/app_input_widget_two.dart';
// import 'package:loyalty_customer/widget/appbar/custom_appbar.dart';

// class ChangePassScreen extends StatelessWidget {
//   const ChangePassScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final AppThemeColor appThemeColor = Theme.of(
//       context,
//     ).extension<AppThemeColor>()!;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: AppSize.width(value: 16),
//             vertical: AppSize.width(value: 20),
//           ),
//           child: AppButton(
//             filColor: appThemeColor.icon,
//             titleColor: appThemeColor.text3,
//             title: "Save",
//             titleSize: AppSize.width(value: 18),
//             borderRadius: BorderRadius.circular(AppSize.width(value: 24)),
//           ),
//         ),
//       ),
//       appBar: CustomAppbar(
//         text: "Change Password",
//         appThemeColor: appThemeColor,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             AppImage(
//               width: AppSize.size.width * 0.6,
//               path: AssetsPath.changePassImg,
//             ),

//             Padding(
//               padding: EdgeInsets.all(AppSize.width(value: 16)),
//               child: Container(
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withValues(alpha: .1), // Shadow color
//                       offset: Offset(
//                         0,
//                         2,
//                       ), // Vertical offset, giving shadow on bottom
//                       blurRadius: 8, // Blur radius
//                     ),
//                     BoxShadow(
//                       color: Colors.black.withValues(alpha: .1), // Shadow color
//                       offset: Offset(
//                         0,
//                         -2,
//                       ), // Vertical offset, giving shadow on top
//                       blurRadius: 8, // Blur radius
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(AppSize.width(value: 12)),
//                   color: AppColor.surfacePrimaryLight,
//                 ),
//                 padding: EdgeInsets.all(AppSize.width(value: 20)),
//                 child: Column(
//                   spacing: AppSize.size.height * 0.01,
//                   children: [
//                     AppInputWidgetTwo(
//                       isOptional: true,
//                       title: "Old Password",
//                       hintText: "Enter Old Password",
//                     ),
//                     AppInputWidgetTwo(
//                       isOptional: true,
//                       title: "New Password",
//                       hintText: "Enter New Password",
//                     ),
//                     AppInputWidgetTwo(
//                       isOptional: true,
//                       title: "Confirm Password",
//                       hintText: "Enter Confirm Password",
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
