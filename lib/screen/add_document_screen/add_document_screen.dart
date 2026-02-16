import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class AddDocumentScreen extends StatelessWidget {
  const AddDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "My Document"),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(value: 12),
          vertical: AppSize.width(value: 24),
        ),
        decoration: BoxDecoration(color: AppColor.white),
        child: AppButton(
          onTap: () {
            Get.back();
          },
          title: "Submit",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(value: 16),
          vertical: AppSize.width(value: 12),
        ),
        child: Column(
          children: [
            AppInputWidgetTwo(
              hintColor: AppColor.white,
              hintText: "Upload your image",

              fillColor: AppColor.purple,
            ),
            AppInputWidgetTwo(
              hintColor: AppColor.white,
              hintText: "Upload your file",

              fillColor: AppColor.purple,
            ),
          ],
        ),
      ),
    );
  }
}
