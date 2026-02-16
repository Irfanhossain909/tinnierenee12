import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/employee_shift_details_screen/controller/employee_shift_details_controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_calender/app_calender.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_date_fortter/time_calculator.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_map/custom_map.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class EmployeeShiftDetailsScreen extends StatelessWidget {
  const EmployeeShiftDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeShiftDetailsController>(
      init: EmployeeShiftDetailsController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppbar(title: "Shift Details"),
          body: Padding(
            padding: EdgeInsets.only(top: AppSize.width(value: 16)),
            child: AppCard(
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
                              controller
                                  .myShiftModelData
                                  .value
                                  ?.job
                                  ?.jobImage ??
                              "https://cdn.pixabay.com/photo/2024/07/06/04/27/map-8875910_1280.png",
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              data:
                                  controller
                                      .myShiftModelData
                                      .value
                                      ?.job
                                      ?.title ??
                                  "Sunny Smiles Daycare",
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
                                        controller
                                            .myShiftModelData
                                            .value
                                            ?.job
                                            ?.address ??
                                        "123 Meadow Lane, Springfield, IL 62704 ",
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
                      data: "Shift Details",
                      fontSize: AppSize.width(value: 16),
                      fontWeight: FontWeight.w700,
                      color: AppColor.purple,
                    ),
                    Gap(height: AppSize.width(value: 12)),
                    AppText(
                      data:
                          "\$${controller.myShiftModelData.value?.job?.price}/hr",
                      fontSize: AppSize.width(value: 14),
                      fontWeight: FontWeight.w700,
                      color: AppColor.purple,
                    ),
                    Row(
                      spacing: AppSize.width(value: 4),
                      children: [
                        Icon(Icons.calendar_month_outlined),
                        AppText(
                          data:
                              "${controller.myShiftModelData.value?.job?.startDate}",
                        ),
                      ],
                    ),
                    Row(
                      spacing: AppSize.width(value: 4),
                      children: [
                        Icon(Icons.watch_later_outlined),
                        AppText(
                          data: formatTimeRangeFromString(
                            controller.myShiftModelData.value?.job?.startTime,
                            controller.myShiftModelData.value?.job?.endTime,
                          ),
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
                      latitude:
                          controller.myShiftModelData.value?.job?.lat ?? 0.0,
                      longitude:
                          controller.myShiftModelData.value?.job?.lng ?? 0.0,
                    ),

                    Gap(height: AppSize.width(value: 12)),
                    AppText(
                      data: "My Working Day",
                      fontSize: AppSize.width(value: 18),
                      fontWeight: FontWeight.w700,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomCalendar(
                        startDate:
                            controller.myShiftModelData.value?.job?.startDate ??
                            "",
                        endDate:
                            controller.myShiftModelData.value?.job?.endDate ??
                            "",
                      ),
                    ),
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
