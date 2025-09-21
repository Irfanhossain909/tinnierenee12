import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class EmployeePersonalInfoSubmitScreenThree extends StatelessWidget {
  const EmployeePersonalInfoSubmitScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios, color: AppColor.black),
        ),
        toolbarHeight: 120,
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Column(
          children: [
            AppText(
              data: "Personal Information",
              fontSize: AppSize.width(value: 17),
              color: AppColor.black,
              fontWeight: FontWeight.w700,
            ),
            Gap(height: AppSize.width(value: 8)),
            AppText(
              height: 1.6,
              textAlign: TextAlign.center,
              maxLines: 3,
              data:
                  "Provide your personal information below, we will use this to request your background check when you get hired for a Child Care Center Role.",
              fontSize: AppSize.width(value: 12),
              color: AppColor.black,
            ),
          ],
        ),

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(value: 12),
          vertical: AppSize.width(value: 24),
        ),
        decoration: BoxDecoration(color: AppColor.white),
        child: AppButton(
          onTap: () {
            Get.close(3);
          },
          title: "Submit",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.width(value: 12)),
        child: SingleChildScrollView(
          child: Column(
            spacing: AppSize.size.height * 0.01,
            children: [
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Digital Signature",

                fillColor: AppColor.purple,
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
