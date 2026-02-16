import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/profile_section/chnage_pass_screen/controller/change_password_controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
import 'package:tinnierenee12/widget/app_loading/app_loading.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class ChangePassScreen extends StatelessWidget {
  const ChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      init: ChangePasswordController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width(value: 16),
                vertical: AppSize.width(value: 20),
              ),
              child: AppButton(
                onTap: () {
                  controller.changePassword();
                },
                title: "Save",
                titleSize: AppSize.width(value: 18),
                borderRadius: BorderRadius.circular(AppSize.width(value: 24)),
              ),
            ),
          ),
          appBar: CustomAppbar(title: "Change Password"),
          body: SingleChildScrollView(
            child: Column(
              children: [
                AppImage(
                  width: AppSize.size.width * 0.6,
                  path: AssetsPath.changePass,
                ),

                Padding(
                  padding: EdgeInsets.all(AppSize.width(value: 16)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppSize.width(value: 12),
                      ),
                      color: AppColor.white,
                    ),
                    padding: EdgeInsets.all(AppSize.width(value: 20)),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        spacing: AppSize.size.height * 0.01,
                        children: [
                          AppInputWidgetTwo(
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller.oldPasswordController,
                            textColor: AppColor.black,
                            borderColor: AppColor.black,
                            hintColor: AppColor.black.withValues(alpha: 0.4),
                            isOptional: true,
                            isPassWord: true,
                            passIconColor: AppColor.black,
                            title: "Old Password",
                            hintText: "Enter Old Password",
                            validator: (value) =>
                                controller.validateOldPassword(value),
                          ),
                          AppInputWidgetTwo(
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller.newPasswordController,
                            textColor: AppColor.black,
                            borderColor: AppColor.black,
                            passIconColor: AppColor.black,
                            hintColor: AppColor.black.withValues(alpha: 0.4),
                            isOptional: true,
                            isPassWord: true,
                            title: "New Password",
                            hintText: "Enter New Password",
                            validator: (value) =>
                                controller.validateNewPassword(value),
                          ),
                          AppInputWidgetTwo(
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller.confirmPasswordController,
                            textColor: AppColor.black,
                            borderColor: AppColor.black,
                            passIconColor: AppColor.black,
                            hintColor: AppColor.black.withValues(alpha: 0.4),
                            isOptional: true,
                            isPassWord: true,
                            title: "Confirm Password",
                            hintText: "Enter Confirm Password",
                            validator: (value) =>
                                controller.validateConfirmPassword(
                                  value,
                                  controller.newPasswordController.text,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Obx(() {
                  return controller.isLoading.value ? AppLoading() : SizedBox();
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
