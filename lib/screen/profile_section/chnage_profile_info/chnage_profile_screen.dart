import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/profile_section/chnage_profile_info/controller/change_profile_controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
import 'package:tinnierenee12/widget/app_location_field/placesSuggation.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class ChnageProfileScreen extends StatelessWidget {
  const ChnageProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeProfileController>(
      init: ChangeProfileController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppbar(title: "Change Profile Information"),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Gap(height: AppSize.size.height * 0.005),
                Obx(() {
                  return Stack(
                    children: [
                      Container(
                        width: AppSize.size.width * 0.30,
                        height: AppSize.size.height * 0.135,
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
                        bottom: 0,
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
                        AppInputWidgetTwo(
                          controller: controller.nameController,
                          textColor: AppColor.black,
                          borderColor: AppColor.black,
                          hintColor: AppColor.black.withValues(alpha: 0.4),
                          isOptional: true,
                          title: "Full Name",
                          hintText: "Enter NAme",
                        ),
                        AppInputWidgetTwo(
                          controller: controller.phoneController,
                          textColor: AppColor.black,
                          borderColor: AppColor.black,
                          hintColor: AppColor.black.withValues(alpha: 0.4),
                          isOptional: true,
                          title: "Phone Number",
                          hintText: "Enter Number",
                        ),
                        AppText(
                          data: "Email",
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: AppColor.black,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.snackbar(
                              "Warning!!!",
                              "Email can't be changed",
                            );
                          },
                          child: Container(
                            width: AppSize.width(value: double.infinity),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.black.withValues(alpha: 0.1),
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
                              color: AppColor.black.withValues(alpha: 0.2),
                            ),
                          ),
                        ),
                        AppText(
                          data: "Address",
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: AppColor.black,
                        ),
                        Obx(
                          () => PlaceAutocompleteWidget(
                            borderColor: AppColor.black,
                            contentPadding: EdgeInsets.all(
                              AppSize.height(value: 14),
                            ),
                            hintColor: AppColor.black.withValues(alpha: 0.4),
                            textColor: AppColor.black,
                            borderRadius: AppSize.width(value: 12),
                            controller:
                                controller.locationController.searchController,
                            hintText: 'Enter location',
                            borderWidth: 0.9,
                            showCurrentLocation:
                                controller.locationController.hasLocationData,
                            currentLocationAddress:
                                controller
                                    .locationController
                                    .selectedAddress
                                    .value
                                    .isNotEmpty
                                ? controller
                                      .locationController
                                      .selectedAddress
                                      .value
                                : null,
                            currentLocationLat:
                                controller
                                        .locationController
                                        .selectedLatitude
                                        .value !=
                                    0.0
                                ? controller
                                      .locationController
                                      .selectedLatitude
                                      .value
                                : null,
                            currentLocationLng:
                                controller
                                        .locationController
                                        .selectedLongitude
                                        .value !=
                                    0.0
                                ? controller
                                      .locationController
                                      .selectedLongitude
                                      .value
                                : null,
                            onPlaceSelected:
                                (
                                  placeId,
                                  description, {
                                  isCurrentLocation = false,
                                  lat,
                                  lng,
                                }) {
                                  controller.locationController.onPlaceSelected(
                                    placeId,
                                    description,
                                    isCurrentLocation: isCurrentLocation,
                                    lat: lat,
                                    lng: lng,
                                  );
                                },
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width(value: 16),
                vertical: AppSize.width(value: 20),
              ),
              child: AppButton(
                onTap: () {
                  controller.updateProfile();
                },
                title: "Save",
                titleSize: AppSize.width(value: 18),
                borderRadius: BorderRadius.circular(AppSize.width(value: 24)),
              ),
            ),
          ),
        );
      },
    );
  }
}
