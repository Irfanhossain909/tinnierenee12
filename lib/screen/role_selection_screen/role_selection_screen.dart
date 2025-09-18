import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppImage(
          path: AssetsPath.appLogo,
          width: AppSize.size.width * 0.65,
          // height: AppSize.size.width * 0.22,
          fit: BoxFit.contain,
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: AppSize.width(value: 20),
          right: AppSize.width(value: 20),
          top: AppSize.width(value: 20),
          bottom: AppSize.width(value: 40),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.width(value: 16)),
            topRight: Radius.circular(AppSize.width(value: 16)),
          ),
          color: AppColor.white,
        ),
        child: Column(
          spacing: AppSize.size.height * 0.02,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              data: "Choose Your Role",
              fontSize: AppSize.width(value: 18),
              color: AppColor.black,
              fontWeight: FontWeight.w600,
            ),
            AppText(
              textAlign: TextAlign.center,
              data:
                  "Select your role to continue and get started with the right experience.",
            ),

            Gap(height: AppSize.width(value: 16)),

            AppButton(
              onTap: () {
                Get.toNamed(AppRoutes.instance.onBoardingScreen1);
              },
              width: AppSize.size.width * 0.5,
              title: "I'm a Employee",
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.black),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width(value: 55),
                vertical: AppSize.width(value: 16),
              ),
              child: AppText(
                data: "I'm a Client",
                color: AppColor.black,
                fontWeight: FontWeight.w600,
                fontSize: AppSize.width(value: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
