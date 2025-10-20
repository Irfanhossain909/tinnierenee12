import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/screen/profile_section/contact_us_screen/controller/contact_us_controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_input/add_descreption_text_field.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
import 'package:tinnierenee12/widget/app_loading/app_loading.dart';
import 'package:tinnierenee12/widget/app_snackbar/app_snackbar.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(
      init: ContactUsController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width(value: 16),
                vertical: AppSize.width(value: 20),
              ),
              child: AppButton(
                onTap: () {
                  controller.sendContactUs();
                },
                title: "Submit",
                titleSize: AppSize.width(value: 18),
                borderRadius: BorderRadius.circular(AppSize.width(value: 24)),
              ),
            ),
          ),
          appBar: CustomAppbar(title: "Contact Us"),
          body: Center(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: AppSize.size.height * 0.01,
                            children: [
                              AppText(
                                data: "Contact Us",
                                fontSize: AppSize.width(value: 18),
                                fontWeight: FontWeight.w700,
                                color: AppColor.black,
                              ),
                              AppText(
                                data: "Full Name",
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: AppColor.black,
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppSnackbar.message(
                                    title: "Warning!!!",
                                    message: "Name can't be changed",
                                  );
                                },
                                child: Container(
                                  width: AppSize.width(value: double.infinity),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColor.black.withValues(
                                        alpha: 0.1,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: EdgeInsets.all(20),

                                  child: AppText(
                                    data:
                                        controller
                                            .profileController
                                            .profileData
                                            .value
                                            ?.name ??
                                        "",
                                    fontSize: AppSize.width(value: 16),
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black.withValues(
                                      alpha: 0.2,
                                    ),
                                  ),
                                ),
                              ),
                              AppText(
                                data: "Email",
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: AppColor.black,
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppSnackbar.message(
                                    title: "Warning!!!",
                                    message: "Email can't be changed",
                                  );
                                },
                                child: Container(
                                  width: AppSize.width(value: double.infinity),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColor.black.withValues(
                                        alpha: 0.1,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: EdgeInsets.all(20),

                                  child: AppText(
                                    data:
                                        controller
                                            .profileController
                                            .profileData
                                            .value
                                            ?.email ??
                                        "",
                                    fontSize: AppSize.width(value: 16),
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black.withValues(
                                      alpha: 0.2,
                                    ),
                                  ),
                                ),
                              ),
                              AppInputWidgetTwo(
                                controller: controller.subjectController,
                                textColor: AppColor.black,
                                borderColor: AppColor.black,
                                hintColor: AppColor.black.withValues(
                                  alpha: 0.4,
                                ),
                                isOptional: true,
                                title: "Subject",
                                hintText: "Enter Subject",
                              ),
                              AppDescriptionTextField(
                                controller: controller.messageController,
                                textColor: AppColor.black,
                                titleColor: AppColor.black,
                                hintColor: AppColor.black.withValues(
                                  alpha: 0.4,
                                ),
                                title: 'Feedback',
                                fillColor: AppColor.white,
                                hintText: "Write Your Feedback Here",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppSize.width(value: 12),
                                  ),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Obx(() {
                      return controller.isLoading.value
                          ? AppLoading()
                          : SizedBox();
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
