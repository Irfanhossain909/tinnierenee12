import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class EmployeePersonalInfoSubmitScreenOne extends StatelessWidget {
  const EmployeePersonalInfoSubmitScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Personal Information"),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(value: 12),
          vertical: AppSize.width(value: 24),
        ),
        decoration: BoxDecoration(color: AppColor.white),
        child: AppButton(
          onTap: () {
            Get.toNamed(AppRoutes.instance.employeePersonalInfoSubmitScreen2);
          },
          title: "Continue",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.width(value: 12)),
        child: SingleChildScrollView(
          child: Column(
            spacing: AppSize.size.height * 0.01,
            children: [
              AppCard(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: AppImage(
                          height: AppSize.size.height * 0.15,
                          url:
                              "https://cdn.pixabay.com/photo/2025/09/12/02/36/rice-9829225_640.jpg",
                        ),
                      ),
                    ),
                    Gap(width: AppSize.width(value: 12)),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        spacing: AppSize.size.height * 0.01,

                        children: [
                          AppText(
                            data: "James Stave",
                            fontSize: AppSize.width(value: 18),
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                          AppText(
                            data: "example@email.com",
                            fontSize: AppSize.width(value: 10),
                            color: AppColor.black,
                          ),
                          AppText(
                            data: "123456789",
                            fontSize: AppSize.width(value: 10),
                            color: AppColor.black,
                          ),
                          AppText(
                            data: "13th Ohio, New Work, US-110011",
                            fontSize: AppSize.width(value: 10),
                            color: AppColor.black,
                          ),
                          AppText(
                            data: "DOB: 9/14/1999",
                            fontSize: AppSize.width(value: 10),
                            color: AppColor.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Select Your Gender",
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
                hintText: "Enter Your Height Feet",

                fillColor: AppColor.purple,
              ),
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Enter Your Height Inches",

                fillColor: AppColor.purple,
              ),
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Enter Your Weight",

                fillColor: AppColor.purple,
              ),
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Confirm Social Security Number",

                fillColor: AppColor.purple,
              ),
              AppInputWidgetTwo(
                hintColor: AppColor.white,
                hintText: "Select Place Of Birth",
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
                hintText: "Select Your Citizenship",
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
                hintText: "Select Your Race",
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
                hintText: "Select Your Ethnicity",
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
            ],
          ),
        ),
      ),
    );
  }
}
