import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/screen/employee_find_shift_screen/controller/employee_find_shift_controller.dart';
import 'package:tinnierenee12/screen/employee_find_shift_screen/widget/employee_find_shift_card.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_date_fortter/date_time_formetter_pro.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_loading/app_loading.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';
import 'package:tinnierenee12/widget/app_renge_slider/app_render_slider.dart';
import 'package:tinnierenee12/widget/app_snackbar/app_snackbar.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class EmployeeFindShiftScreen extends StatelessWidget {
  const EmployeeFindShiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeFindShiftController>(
      init: EmployeeFindShiftController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppbar(
            action: [
              Padding(
                padding: EdgeInsets.only(right: AppSize.width(value: 16)),
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        decoration: BoxDecoration(color: AppColors.white),
                        height: AppSize.size.height * 0.5,
                        width: double.infinity,
                        child: Column(
                          children: [
                            AppText(
                              data: "Job Filter",
                              fontSize: AppSize.width(value: 18),
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                            Divider(color: AppColors.black, thickness: 2),

                            Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: AppSize.width(value: 12),
                                children: [
                                  AppText(
                                    data: "Distance",
                                    fontSize: AppSize.width(value: 18),
                                    fontWeight: FontWeight.w700,

                                    color: AppColors.purple,
                                  ),

                                  // --- Value Text ---
                                  AppText(
                                    data:
                                        "Maximum Distance: ${controller.progressValue.value.toStringAsFixed(0)} miles",
                                    fontSize: AppSize.width(value: 12),
                                    fontWeight: FontWeight.w400,

                                    color: AppColors.black,
                                  ),

                                  CustomProgressBarSlider(
                                    minimumValue: 10,
                                    value: controller.progressValue.value,
                                    onChanged: (val) {
                                      controller.updateDistance(val);
                                    },
                                  ),
                                  AppText(
                                    data: "Payment",
                                    fontSize: AppSize.width(value: 18),
                                    fontWeight: FontWeight.w700,

                                    color: AppColors.purple,
                                  ),

                                  // --- Value Text ---
                                  AppText(
                                    data:
                                        "${controller.priceValue.value.toStringAsFixed(0)} /hr or more",
                                    fontSize: AppSize.width(value: 12),
                                    fontWeight: FontWeight.w400,

                                    color: AppColors.black,
                                  ),

                                  CustomProgressBarSlider(
                                    minimumValue: 10,
                                    value: controller.priceValue.value,
                                    onChanged: (val) {
                                      controller.updatePrice(val);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: AppImage(
                    path: AssetsPath.filter,
                    width: AppSize.width(value: 28),
                  ),
                ),
              ),
            ],
            autoShowLeading: false,
            title: "Find Shift",
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 16)),
            child: RefreshIndicator(
              onRefresh: () async {
                controller.refreshFindShift();
              },
              child: AppCard(
                height: AppSize.size.height * 0.8,
                child: Obx(() {
                  // যদি প্রথমবার load হচ্ছে এবং list empty থাকে
                  if (controller.isLoading.value &&
                      controller.findShiftList.isEmpty) {
                    return const Center(child: AppLoading());
                  }

                  // যদি list empty হয় এবং loading শেষ হয়ে যায়
                  if (controller.findShiftList.isEmpty &&
                      !controller.isLoading.value) {
                    return Center(child: AppText(data: "No shifts Found"));
                  }
                  return ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.findShiftList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < controller.findShiftList.length) {
                        final shift = controller.findShiftList[index];
                        return EmployeeFindShiftCard(
                          status: shift.status,
                          title: shift.title,
                          address: shift.address,
                          startTime: shift.startTime,
                          endTime: shift.endTime,
                          startDate: DateTimeFormatterPro.format(
                            shift.startDate,
                          ),
                          price: shift.price.toString(),
                          // distance: shift.location.distance.toString(),
                          onTap: () {
                            AppPrint.apiResponse(shift.id);
                            Get.toNamed(
                              AppRoutes.instance.employeeFindShiftDetailsScreen,
                              arguments: shift,
                            );
                          },
                        );
                      } else {
                        // Pagination loading indicator - শুধু যখন আরো data আছে
                        if (controller.isMoreDataAvailable.value) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: AppText(
                                data: "No more shift",
                                fontSize: AppSize.width(value: 16),
                                fontWeight: FontWeight.w600,
                                color: AppColors.purple,
                              ),
                            ),
                          );
                        }
                      }
                    },
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
