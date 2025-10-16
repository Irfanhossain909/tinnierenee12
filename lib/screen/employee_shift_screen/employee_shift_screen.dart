import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/screen/employee_shift_screen/controller/employee_shift_controller.dart';
import 'package:tinnierenee12/screen/employee_shift_screen/widget/shift_card.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_date_fortter/time_calculator.dart';
import 'package:tinnierenee12/widget/app_loading/app_loading.dart';
import 'package:tinnierenee12/widget/app_snackbar/app_snackbar.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class EmployeeShiftScreen extends StatelessWidget {
  const EmployeeShiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeShiftController>(
      init: EmployeeShiftController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppbar(autoShowLeading: false, title: "My Shift"),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 16)),
            child: RefreshIndicator(
              onRefresh: () async {
                controller.refreshMyShiftList();
              },
              child: AppCard(
                height: AppSize.size.height * 0.8,
                child: Obx(() {
                  // যদি প্রথমবার load হচ্ছে এবং list empty থাকে
                  if (controller.isLoading.value &&
                      controller.myShiftModelData.isEmpty) {
                    return const Center(child: AppLoading());
                  }

                  // যদি list empty হয় এবং loading শেষ হয়ে যায়
                  if (controller.myShiftModelData.isEmpty &&
                      !controller.isLoading.value) {
                    return Center(child: AppText(data: "No shifts available"));
                  }

                  // List এ data আছে
                  return ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.myShiftModelData.length + 1,
                    itemBuilder: (context, index) {
                      if (index < controller.myShiftModelData.length) {
                        final data = controller.myShiftModelData[index];
                        return ShiftCard(
                          imgPath: data.job?.jobImage,
                          isApproved: data.status == "rejected",
                          title: data.job?.title ?? "No title",
                          subTitle: data.job?.address ?? "Loading address...",
                          priceHoure: data.job?.price.toString(),
                          date: data.job?.startDate,
                          time: formatTimeRangeFromString(
                            data.job?.startTime,
                            data.job?.endTime,
                          ),
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.instance.employeeShiftDetailsScreen,
                              arguments: data,
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
