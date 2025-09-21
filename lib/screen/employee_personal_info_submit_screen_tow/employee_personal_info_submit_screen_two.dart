import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class EmployeePersonalInfoSubmitScreenTwo extends StatelessWidget {
  const EmployeePersonalInfoSubmitScreenTwo({super.key});

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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.size.width * 0.1,
              ),
              child: AppText(
                height: 1.6,
                textAlign: TextAlign.center,
                maxLines: 3,
                data:
                    "Provide your address history for the past 5 years. Start with your current address and work backwards.",
                fontSize: AppSize.width(value: 12),
                color: AppColor.black,
              ),
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
            Get.toNamed(AppRoutes.instance.employeePersonalInfoSubmitScreen3);
          },
          title: "Continue"),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.width(value: 12)),
        child: SingleChildScrollView(
          child: Column(
            spacing: AppSize.size.height * 0.01,
            children: [
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Enter Your Street Address",

                fillColor: AppColor.purple,
              ),
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Select Your City",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: AppSize.width(value: 18),
                    color: AppColor.white,
                  ),
                ),
                fillColor: AppColor.purple,
              ),
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Select Your State",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: AppSize.width(value: 18),
                    color: AppColor.white,
                  ),
                ),
                fillColor: AppColor.purple,
              ),
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Enter Your Zip Code",

                fillColor: AppColor.purple,
              ),
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Select Your County",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: AppSize.width(value: 18),
                    color: AppColor.white,
                  ),
                ),
                fillColor: AppColor.purple,
              ),
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Enter From Date",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calendar_month_outlined,
                    size: AppSize.width(value: 18),
                    color: AppColor.white,
                  ),
                ),
                fillColor: AppColor.purple,
              ),
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Until Date",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calendar_month_outlined,
                    size: AppSize.width(value: 18),
                    color: AppColor.white,
                  ),
                ),
                fillColor: AppColor.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
