import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/screen/role_selection_screen/role_selection_screen.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_input/add_descreption_text_field.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
import 'package:tinnierenee12/widget/app_input/labeled_radio.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_app_bar_auth.dart';
import 'package:tinnierenee12/screen/auth/personal_info_screen/controller/personal_info_controller.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalInfoController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBarAuth(title: "Personal Information"),
        body: Padding(
          padding: EdgeInsets.all(AppSize.width(value: 16)),
          child: SingleChildScrollView(
            child: Column(
              spacing: AppSize.size.height * 0.01,
              children: [
                AppImageCircular(
                  width: AppSize.width(value: 150),
                  path: AssetsPath.authImg,
                ),
                AppText(
                  data: "Upload Your Profile Picture",
                  fontSize: AppSize.width(value: 16),
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),

                AppInputWidgetTwo(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  fillColor: AppColor.purple,
                  hintText: "Phone Number",
                  borderRadius: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 16),
                    vertical: AppSize.width(value: 10),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.white),
                  ),
                  width: AppSize.width(value: double.infinity),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        data: "Enter Your Birthday",
                        fontSize: AppSize.width(value: 16),
                        color: AppColor.white.withValues(alpha: 0.5),
                      ),
                      Icon(
                        Icons.calendar_month,
                        color: AppColor.white.withValues(alpha: 0.5),
                      ),
                    ],
                  ),
                ),
                AppInputWidgetTwo(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  borderRadius: 8,
                  fillColor: AppColor.purple,
                  hintText: "Enter Your Refer Code",
                ),
                AppDescriptionTextField(
                  title: "About Me",
                  hintText: "Write Your Business Description",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.white),
                  ),
                ),
                AppText(
                  textAlign: TextAlign.justify,
                  data:
                      "Have you worked in a child care center in your state before?",
                  fontSize: 13.4,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                  color: AppColor.white,
                ),
                Obx(() {
                  final selected = controller.workedInChildCare.value;
                  return Row(
                    spacing: AppSize.width(value: 16),
                    children: [
                      LabeledRadio<YesNo>(
                        label: "Yes",
                        value: YesNo.yes,
                        groupValue: selected,
                        onChanged: controller.setWorkedInChildCare,
                      ),
                      LabeledRadio<YesNo>(
                        label: "No",
                        value: YesNo.no,
                        groupValue: selected,
                        onChanged: controller.setWorkedInChildCare,
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: AppColor.white),
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.width(value: 16),
            vertical: AppSize.width(value: 16),
          ),
          child: AppButton(
            onTap: () {
              if (roll == "employee") {
                Get.toNamed(AppRoutes.instance.navigationScreen);
              } else {
                Get.toNamed(AppRoutes.instance.navigationForClientScreen);
              }
            },
            title: "Continue",
          ),
        ),
      ),
    );
  }
}
