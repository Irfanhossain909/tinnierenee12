import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_api_end_point.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/employee_find_shift_details_scrteen/controller/employee_find_shift_details_controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_date_fortter/date_time_formetter_pro.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_loading/app_loading.dart';
import 'package:tinnierenee12/widget/app_location_field/location_repository.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_map/custom_map.dart';
import 'package:tinnierenee12/widget/app_snackbar/app_snackbar.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class EmployeeFindShiftDetailsScreen extends StatelessWidget {
  const EmployeeFindShiftDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeFindShiftDetailsController>(
      init: EmployeeFindShiftDetailsController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Container(
            height: AppSize.size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: AppColor.white,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.width(value: 20),
              vertical: AppSize.width(value: 20),
            ),
            child: Obx(() {
              return controller.isLoading.value
                  ? AppLoading()
                  : (controller.findShiftList.value?.status == "booked"
                        ? AppButton(
                            onTap: () {
                              AppSnackbar.message(
                                title: "Already Applied",
                                message:
                                    "You have already applied for this job.",
                              );
                            },
                            title: "Booked",
                            filColor: AppColor.purple.withValues(alpha: 0.4),
                          )
                        : AppButton(
                            onTap: () {
                              controller.applyShift();
                            },
                            title: "Apply",
                            filColor: AppColor.purple,
                          ));
            }),
          ),
          appBar: CustomAppbar(title: "Shift Full Details"),
          body: Padding(
            padding: EdgeInsets.only(
              top: AppSize.width(value: 16),
              bottom: AppSize.width(value: 16),
            ),
            child: AppCard(
              height: AppSize.size.height * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  spacing: AppSize.size.width * 0.01,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: AppSize.size.width * 0.03,
                      children: [
                        AppImageCircular(
                          width: AppSize.width(value: 54),
                          height: AppSize.width(value: 54),
                          url:
                              "$AppApiEndPoint${controller.findShiftList.value?.jobImage}" ??
                              "https://cdn.pixabay.com/photo/2024/07/06/04/27/map-8875910_1280.png",
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              data:
                                  controller.findShiftList.value?.title ??
                                  "no data",
                              fontSize: AppSize.width(value: 24),
                              fontWeight: FontWeight.w600,
                            ),
                            Gap(height: AppSize.width(value: 8)),
                            Row(
                              children: [
                                AppImage(
                                  path: AssetsPath.icLocation,
                                  width: 18,
                                  height: 18,
                                  iconColor: AppColor.black,
                                ),
                                Gap(width: 4),
                                SizedBox(
                                  width: AppSize.size.width * 0.6,
                                  child: AppText(
                                    maxLines: 2,
                                    data:
                                        "${controller.findShiftList.value?.address}",
                                    fontSize: AppSize.width(value: 12),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(height: AppSize.width(value: 12)),
                    AppText(
                      data: "Job Description",
                      fontSize: AppSize.width(value: 16),
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                    Gap(height: AppSize.width(value: 12)),
                    AppText(
                      data:
                          controller.findShiftList.value?.description ??
                          "Seeking an energetic caregiver to assist with our toddler group (ages 2-3). Responsibilities include supervising indoor/outdoor playtime, assisting with snack and meal times, and maintaining a clean and safe environment. First aid certification is a plus.",
                    ),
                    Gap(height: AppSize.width(value: 12)),
                    AppText(
                      data: "Shift Details",
                      fontSize: AppSize.width(value: 16),
                      fontWeight: FontWeight.w700,
                      color: AppColor.purple,
                    ),
                    Gap(height: AppSize.width(value: 12)),
                    AppText(
                      data:
                          "\$${controller.findShiftList.value?.price ?? 0}/hr",
                      fontSize: AppSize.width(value: 14),
                      fontWeight: FontWeight.w700,
                      color: AppColor.purple,
                    ),
                    Row(
                      spacing: AppSize.width(value: 4),
                      children: [
                        Icon(Icons.calendar_month_outlined),
                        AppText(
                          data: DateTimeFormatterPro.format(
                            controller.findShiftList.value?.startDate,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: AppSize.width(value: 4),
                      children: [
                        Icon(Icons.watch_later_outlined),
                        AppText(
                          data:
                              "${controller.findShiftList.value?.startTime} - ${controller.findShiftList.value?.endTime}",
                        ),
                      ],
                    ),
                    Gap(height: AppSize.width(value: 12)),
                    AppText(
                      data: "Explore Daycare Center on the Map",
                      fontSize: AppSize.width(value: 18),
                      fontWeight: FontWeight.w700,
                    ),

                    CustomGoogleMap(
                      latitude: controller.findShiftList.value?.lat ?? 0.0,
                      longitude: controller.findShiftList.value?.lng ?? 0.0,
                    ),

                    Gap(height: AppSize.width(value: 12)),
                    AppText(
                      data: "Qualifications",
                      fontSize: AppSize.width(value: 18),
                      fontWeight: FontWeight.w600,
                    ),
                    Gap(height: AppSize.width(value: 12)),
                    QualificationRow(
                      text:
                          controller.findShiftList.value?.qualification ??
                          "no data",
                    ),
                    // QualificationRow(text: "First Aid/CPR Certified"),
                    // QualificationRow(text: "High School Diploma or equivalent"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class QualificationRow extends StatelessWidget {
  final String? text;
  const QualificationRow({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSize.width(value: 12),
      children: [
        AppImage(path: AssetsPath.right, width: AppSize.width(value: 16)),
        AppText(
          data: text ?? "no text",
          fontSize: AppSize.width(value: 12),
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
