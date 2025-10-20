import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/profile_screen.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class EmployeeSettingScreen extends StatelessWidget {
  const EmployeeSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Settings"),
      body: Padding(
        padding: EdgeInsets.only(top: 68.0),
        child: AppCard(
          child: Column(
            spacing: AppSize.size.height * 0.04,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileRow(
                iconPath: AssetsPath.pass,
                onTap: () {
                  Get.toNamed(AppRoutes.instance.changePassScreen);
                },
                text: "Password",
              ),
              ProfileRow(
                iconPath: AssetsPath.contactUs,
                onTap: () {
                  Get.toNamed(AppRoutes.instance.contactUsScreen);
                },
                text: "Contact Us",
              ),

              ProfileRow(
                iconPath: AssetsPath.terms,
                onTap: () {
                  Get.toNamed(AppRoutes.instance.termsCondiScreen);
                },
                text: "Terms & Conditions",
              ),
              ProfileRow(
                iconPath: AssetsPath.privicy,
                onTap: () {
                  Get.toNamed(AppRoutes.instance.privicyScreen);
                },
                text: "Privacy Policy",
              ),

              ProfileRow(
                iconPath: AssetsPath.delete,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            spacing: AppSize.size.height * 0.013,
                            children: [
                              Icon(
                                Icons.delete,
                                size: AppSize.width(value: 66),
                              ),
                              AppText(
                                data: "Want to delete account !",
                                fontSize: AppSize.width(value: 18),
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                              AppText(
                                data:
                                    "Please confirm your password to remove your account.",
                                fontSize: AppSize.width(value: 16),
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                                color: Colors.black,
                              ),
                              AppInputWidgetTwo(
                                borderColor: AppColor.black,
                                textColor: AppColor.black,
                                hintColor: AppColor.black.withValues(
                                  alpha: 0.3,
                                ),
                                title: "Password",
                                hintText: "Password",
                              ),
                              Gap(height: 4),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: AppSize.width(value: 18),
                                          vertical: AppSize.width(value: 8),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: AppColor.black,
                                          ),
                                        ),
                                        child: Center(
                                          child: AppText(
                                            data: "Cancel",
                                            fontSize: AppSize.width(value: 16),
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(width: 20),
                                  Expanded(
                                    child: AppButton(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      height: 36,
                                      title: "Delete",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                text: "Delete Account",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
