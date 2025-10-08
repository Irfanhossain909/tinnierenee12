import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/client_add_shift_screen/controller/client_add_new_shift_controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_drop_down/custom_dropdown.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_input/add_descreption_text_field.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
import 'package:tinnierenee12/widget/app_loading/app_loading.dart';
import 'package:tinnierenee12/widget/app_location_field/placesSuggation.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class ClientAddShiftScreen extends StatelessWidget {
  const ClientAddShiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientAddNewShiftController>(
      init: ClientAddNewShiftController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppbar(
            title: "Post a New Shift",
            autoShowLeading: false,
            // action: [
            //   Padding(
            //     padding: EdgeInsets.only(right: AppSize.width(value: 16)),
            //     child: AppImage(
            //       path: AssetsPath.filter,
            //       width: AppSize.width(value: 28),
            //     ),
            //   ),
            // ],
          ),
          body: Padding(
            padding: EdgeInsets.all(AppSize.width(value: 16)),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    spacing: AppSize.size.height * 0.01,
                    children: [
                      Obx(() {
                        return Column(
                          spacing: AppSize.size.height * 0.015,
                          children: [
                            // 🟢 Start Date Picker
                            GestureDetector(
                              onTap: () {
                                controller.startDatePick(context);
                              },
                              child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    controller.selectedStartDate.isEmpty
                                        ? AppText(
                                            data: "Select Start Date",
                                            fontSize: AppSize.width(value: 16),
                                            color: AppColor.white.withValues(
                                              alpha: 0.5,
                                            ),
                                          )
                                        : AppText(
                                            data: controller
                                                .selectedStartDate
                                                .value,
                                            fontSize: AppSize.width(value: 16),
                                            color: AppColor.white,
                                          ),
                                    Icon(
                                      Icons.calendar_month,
                                      color: AppColor.white.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // 🟢 End Date Picker
                            GestureDetector(
                              onTap: () {
                                controller.endDatePick(context);
                              },
                              child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    controller.selectedEndDate.isEmpty
                                        ? AppText(
                                            data: "Select End Date",
                                            fontSize: AppSize.width(value: 16),
                                            color: AppColor.white.withValues(
                                              alpha: 0.5,
                                            ),
                                          )
                                        : AppText(
                                            data: controller
                                                .selectedEndDate
                                                .value,
                                            fontSize: AppSize.width(value: 16),
                                            color: AppColor.white,
                                          ),
                                    Icon(
                                      Icons.calendar_month,
                                      color: AppColor.white.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // 🟢 Start Time Picker
                            GestureDetector(
                              onTap: () {
                                controller.startTimePick(context);
                              },
                              child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    controller.selectedStartTime.isEmpty
                                        ? AppText(
                                            data: "Select Start Time",
                                            fontSize: AppSize.width(value: 16),
                                            color: AppColor.white.withValues(
                                              alpha: 0.5,
                                            ),
                                          )
                                        : AppText(
                                            data: controller
                                                .selectedStartTime
                                                .value,
                                            fontSize: AppSize.width(value: 16),
                                            color: AppColor.white,
                                          ),
                                    Icon(
                                      Icons.watch_later_outlined,
                                      color: AppColor.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // 🟢 End Time Picker
                            GestureDetector(
                              onTap: () {
                                controller.endTimePick(context);
                              },
                              child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    controller.selectedEndTime.isEmpty
                                        ? AppText(
                                            data: "Select End Time",
                                            fontSize: AppSize.width(value: 16),
                                            color: AppColor.white.withValues(
                                              alpha: 0.5,
                                            ),
                                          )
                                        : AppText(
                                            data: controller
                                                .selectedEndTime
                                                .value,
                                            fontSize: AppSize.width(value: 16),
                                            color: AppColor.white,
                                          ),
                                    Icon(
                                      Icons.watch_later_outlined,
                                      color: AppColor.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                      Obx(
                        () => PlaceAutocompleteWidget(
                          controller:
                              controller.locationController.searchController,
                          hintText: 'Enter location',
                          hintColor: AppColor.white.withValues(alpha: 0.5),
                          contentPadding: EdgeInsets.all(
                            AppSize.width(value: 16),
                          ),
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
                      AppInputWidgetTwo(
                        controller: controller.titleController,
                        fillColor: AppColor.purple,
                        hintText: "Title",
                      ),
                      AppDescriptionTextField(
                        controller: controller.descriptionLicenseController,
                        hintText: "Write Your Job Description",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.white),
                        ),
                      ),
                      AppDescriptionTextField(
                        controller: controller.qualificationController,
                        hintText: "Enter Qualification Require For this job",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.white),
                        ),
                      ),
                      Gap(height: AppSize.width(value: 4)),
                      CustomDropdown(
                        items: ["school", "infant", "pre-school"],

                        // selectedValue: "school",
                        hint: "Select Age Group",
                        onChanged: (value) {
                          controller.selectedAgeGroup = value!;
                        },
                        textColor: AppColor.white.withValues(alpha: 0.7),
                        borderColor: AppColor.white,
                        borderRadius: AppSize.width(value: 8),
                        hintColor: AppColor.white.withValues(alpha: 0.5),
                      ),

                      AppInputWidgetTwo(
                        controller: controller.priceController,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.currency_exchange,
                            color: AppColor.white.withValues(alpha: 0.7),
                            size: AppSize.width(value: 18),
                          ),
                        ),

                        fillColor: AppColor.purple,
                        hintText: "Price",
                      ),
                      Gap(height: AppSize.width(value: 4)),

                      Gap(height: AppSize.width(value: 4)),
                    ],
                  ),
                  Positioned.fill(
                    child: Obx(() {
                      return controller.isLoading.value
                          ? AppLoading(size: 68)
                          : SizedBox();
                    }),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 16)),
            height: AppSize.size.height * 0.06,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColor.white),
                    ),
                    child: Center(
                      child: AppText(
                        data: "Cancel",
                        fontSize: AppSize.width(value: 16),
                        fontWeight: FontWeight.w500,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
                Gap(width: AppSize.width(value: 16)),
                Expanded(
                  child: AppButton(
                    onTap: () {
                      controller.addjob();
                    },
                    title: "Post Shift",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
