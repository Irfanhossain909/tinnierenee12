// import 'package:flutter/material.dart';
// import 'package:loyalty_customer/const/app_color.dart';
// import 'package:loyalty_customer/const/app_theme_color.dart';
// import 'package:loyalty_customer/utils/app_size.dart';
// import 'package:loyalty_customer/widget/app_button/app_button.dart';
// import 'package:loyalty_customer/widget/app_input/add_descreption_text_field.dart';
// import 'package:loyalty_customer/widget/app_input/app_input_widget_two.dart';
// import 'package:loyalty_customer/widget/app_text/app_text.dart';
// import 'package:loyalty_customer/widget/appbar/custom_appbar.dart';

// class ContactUsScreen extends StatelessWidget {
//   const ContactUsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final AppThemeColor appThemeColor = Theme.of(
//       context,
//     ).extension<AppThemeColor>()!;
//     return Scaffold(
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: AppSize.width(value: 16),
//             vertical: AppSize.width(value: 20),
//           ),
//           child: AppButton(
//             filColor: appThemeColor.icon,
//             titleColor: appThemeColor.text3,
//             title: "Submit",
//             titleSize: AppSize.width(value: 18),
//             borderRadius: BorderRadius.circular(AppSize.width(value: 24)),
//           ),
//         ),
//       ),
//       appBar: CustomAppbar(text: "Contact Us", appThemeColor: appThemeColor),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
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
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   spacing: AppSize.size.height * 0.01,
//                   children: [
//                     AppText(
//                       data: "Contact Us",
//                       fontSize: AppSize.width(value: 18),
//                       fontWeight: FontWeight.w700,
//                       color: appThemeColor.text4,
//                     ),
//                     AppInputWidgetTwo(
//                       isOptional: true,
//                       title: "Full Name",
//                       hintText: "Enter Name",
//                     ),
//                     AppInputWidgetTwo(
//                       isOptional: true,
//                       title: "Email",
//                       hintText: "Enter Email",
//                     ),
//                     AppInputWidgetTwo(
//                       isOptional: true,
//                       title: "Subject",
//                       hintText: "Enter Subject",
//                     ),
//                     AppDescriptionTextField(
//                       title: 'Feedback',
//                       hintText: "Write Your Feedback Here",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(
//                           AppSize.width(value: 12),
//                         ),
//                         borderSide: BorderSide(color: Colors.black),
//                       ),
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
