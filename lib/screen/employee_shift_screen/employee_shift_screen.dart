import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/screen/employee_shift_screen/controller/employee_shift_controller.dart';
import 'package:tinnierenee12/screen/employee_shift_screen/widget/shift_card.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_date_fortter/time_calculator.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class EmployeeShiftScreen extends StatelessWidget {
  const EmployeeShiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<EmployeeShiftController>(
      init: EmployeeShiftController(),
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: CustomAppbar(autoShowLeading: false, title: "My Shift"),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 16)),
            child: AppCard(
              child: ListView.builder(
                itemCount: controller.myShiftModelData.length,
                itemBuilder: (context, index) {
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
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
