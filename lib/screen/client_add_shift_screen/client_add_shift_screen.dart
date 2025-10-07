import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/client_add_shift_screen/controller/client_add_new_shift_controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_input/add_descreption_text_field.dart';
import 'package:tinnierenee12/widget/app_input/app_input_widget_two.dart';
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
            action: [
              Padding(
                padding: EdgeInsets.only(right: AppSize.width(value: 16)),
                child: AppImage(
                  path: AssetsPath.filter,
                  width: AppSize.width(value: 28),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(AppSize.width(value: 16)),
            child: SingleChildScrollView(
              child: Column(
                spacing: AppSize.size.height * 0.01,
                children: [
                  Obx(() {
                    return GestureDetector(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    data: controller.selectedStartDate.value,
                                    fontSize: AppSize.width(value: 16),
                                    color: AppColor.white,
                                  ),
                            Icon(
                              Icons.calendar_month,
                              color: AppColor.white.withValues(alpha: 0.5),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  Obx(() {
                    return GestureDetector(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    data: controller.selectedEndDate.value,
                                    fontSize: AppSize.width(value: 16),
                                    color: AppColor.white,
                                  ),
                            Icon(
                              Icons.calendar_month,
                              color: AppColor.white.withValues(alpha: 0.5),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

                  AppInputWidgetTwo(
                    fillColor: AppColor.purple,
                    hintText: "Select Start Time",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.watch_later_outlined,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  AppInputWidgetTwo(
                    fillColor: AppColor.purple,
                    hintText: "Select End Time",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.watch_later_outlined,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  AppInputWidgetTwo(
                    fillColor: AppColor.purple,
                    hintText: "Title",
                  ),
                  AppDescriptionTextField(
                    hintText: "Write Your Job Description",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.white),
                    ),
                  ),
                  AppDescriptionTextField(
                    hintText: "Enter Qualification Require For this job",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.white),
                    ),
                  ),
                  AppInputWidgetTwo(
                    fillColor: AppColor.purple,
                    hintText: "Age Group",
                  ),

                  AppInputWidgetTwo(
                    fillColor: AppColor.purple,
                    hintText: "Price",
                  ),

                  Row(
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
                      Expanded(child: AppButton(title: "Post Shift")),
                    ],
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
