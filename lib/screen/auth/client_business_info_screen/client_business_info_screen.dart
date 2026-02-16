import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_input/add_descreption_text_field.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
import 'package:tinnierenee12/widget/app_loading/app_loading.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_app_bar_auth.dart';
import 'package:tinnierenee12/screen/auth/client_business_info_screen/controller/client_business_info_controller.dart';

class ClientBusinessInfoScreen extends StatelessWidget {
  const ClientBusinessInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientBusinessInfoController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBarAuth(title: "Center Information"),
        body: Padding(
          padding: EdgeInsets.all(AppSize.width(value: 16)),
          child: SingleChildScrollView(
            child: Column(
              spacing: AppSize.size.height * 0.01,
              children: [
                Obx(() {
                  return Stack(
                    children: [
                      Container(
                        width: AppSize.size.width * 0.38,
                        height: AppSize.size.height * 0.17,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.white, width: 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            child: controller.cameraImage.value.isNotEmpty
                                ? AppImageCircular(
                                    filePath: controller.cameraImage.value,
                                  )
                                : AppImageCircular(
                                    url:
                                        "https://cdn.pixabay.com/photo/2017/11/10/04/47/image-2935360_640.png",
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,

                        child: InkWell(
                          onTap: () {
                            controller.getImage(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: AppColor.white,
                                width: 1,
                              ),
                              color: AppColor.purple,
                            ),
                            child: AppImage(
                              path: AssetsPath.camera,
                              iconColor: AppColor.white,
                              width: AppSize.width(value: 16),
                              height: AppSize.width(value: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                AppText(
                  data: "Upload Your Business Logo",
                  fontSize: AppSize.width(value: 16),
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),

                AppInputWidgetTwo(
                  controller: controller.nameController,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  fillColor: AppColor.purple,
                  hintText: "Enter Your Business Name",
                  borderRadius: 8,
                ),
                AppInputWidgetTwo(
                  controller: controller.stateLicenseController,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  fillColor: AppColor.purple,
                  hintText: "State License ID",
                  borderRadius: 8,
                ),
                AppInputWidgetTwo(
                  controller: controller.weblinkController,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  fillColor: AppColor.purple,
                  hintText: "Website Link (Optional)",
                  borderRadius: 8,
                ),
                AppDescriptionTextField(
                  controller: controller.aboutMeController,
                  title: "About Me",
                  textColor: AppColor.white,

                  hintText: "Write Your Business Description",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.white),
                  ),
                ),

                Obx(() {
                  return controller.isLoading.value ? AppLoading() : SizedBox();
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
              controller.centerInfoUpdate();
            },
            title: "Continue",
          ),
        ),
      ),
    );
  }
}
