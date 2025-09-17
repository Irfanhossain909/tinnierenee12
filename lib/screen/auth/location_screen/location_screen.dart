import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_app_bar_auth.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarAuth(),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AppImage(
            width: AppSize.width(value: 200),
            height: AppSize.width(value: 200),
            path: AssetsPath.authImg,
          ),

          AppText(
            data: "Set Your Location",
            fontSize: AppSize.width(value: 28),
            fontWeight: FontWeight.w700,
            color: AppColor.white,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSize.width(value: 12),
              horizontal: AppSize.width(value: 40),
            ),
            child: AppText(
              data:
                  "To help us connect you with nearby service providers or customers, please allow access to your location.",
              textAlign: TextAlign.center,
              fontSize: AppSize.width(value: 16),
              fontWeight: FontWeight.w400,
              color: AppColor.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSize.width(value: 12)),

            child: Column(
              spacing: AppSize.size.height * 0.01,
              children: [
                Container(
                  width: AppSize.width(value: double.infinity),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 1.5, color: AppColor.white),

                    color: AppColor.white.withValues(alpha: .3),
                  ),
                  child: Center(
                    child: AppText(
                      data: "Allow Location Access",
                      fontSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w400,
                      color: AppColor.white,
                    ),
                  ),
                ),
                AppInputWidgetTwo(
                  hintText: "Enter your location manually",
                  fillColor: AppColor.purple,
                ),
                Gap(height: 16),
                AppButton(
                  onTap: () {
                    // Get.toNamed(AppRoutes.instance.preferencesScreen);
                  },
                  title: "Continue",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
