// import 'package:flutter/material.dart';
// import 'package:loyalty_customer/const/app_color.dart';
// import 'package:loyalty_customer/const/app_theme_color.dart';
// import 'package:loyalty_customer/const/assets_icons_path.dart';
// import 'package:loyalty_customer/utils/app_size.dart';
// import 'package:loyalty_customer/widget/app_button/app_button.dart';
// import 'package:loyalty_customer/widget/app_image/app_image.dart';
// import 'package:loyalty_customer/widget/app_image/app_image_circular.dart';
// import 'package:loyalty_customer/widget/app_input/app_input_widget_two.dart';
// import 'package:loyalty_customer/widget/appbar/custom_appbar.dart';

// class ChnageProfileScreen extends StatelessWidget {
//   const ChnageProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final AppThemeColor appThemeColor = Theme.of(
//       context,
//     ).extension<AppThemeColor>()!;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: CustomAppbar(
//         text: "Change Profile Information",
//         appThemeColor: appThemeColor,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 AppImageCircular(
//                   fit: BoxFit.cover,
//                   url:
//                       "https://cdn.pixabay.com/photo/2016/12/07/21/01/cartoon-1890438_640.jpg",
//                   width: AppSize.width(value: 148),
//                   height: AppSize.width(value: 148),
//                 ),
//                 Positioned(
//                   bottom: 2,
//                   right: 0,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: appThemeColor.stroke2),
//                       borderRadius: BorderRadius.circular(
//                         AppSize.width(value: 24),
//                       ),
//                       color: appThemeColor.surfacePrimary,
//                     ),
//                     padding: EdgeInsets.all(AppSize.width(value: 8)),
//                     child: AppImage(
//                       iconColor: appThemeColor.stroke2,
//                       path: AssetsPath.icCamera,
//                       width: AppSize.width(value: 18),
//                       height: AppSize.width(value: 18),
//                     ),
//                   ),
//                 ),
//               ],
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
//                       title: "Full Name",
//                       hintText: "Enter NAme",
//                     ),
//                     AppInputWidgetTwo(
//                       isOptional: true,
//                       title: "Phone Number",
//                       hintText: "Enter Number",
//                     ),
//                     AppInputWidgetTwo(
//                       isOptional: true,
//                       title: "Email",
//                       hintText: "Enter Email",
//                     ),
//                     AppInputWidgetTwo(
//                       isOptional: true,
//                       title: "Address",
//                       hintText: "Enter Address",
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
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
//     );
//   }
// }
