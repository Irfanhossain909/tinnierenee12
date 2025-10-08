import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/screen/client_home_screen/client_home_screen.dart';
import 'package:tinnierenee12/screen/client_shift_screen/controller/client_shift_controller.dart';
import 'package:tinnierenee12/screen/client_shift_screen/widget/shift_complate_card.dart';
import 'package:tinnierenee12/screen/client_shift_screen/widget/substitute_card.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_date_fortter/time_calculator.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class ClientShiftScreen extends StatelessWidget {
  const ClientShiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientShiftController>(
      init: ClientShiftController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppbar(
            title: "My Shift",
            autoShowLeading: false,
            action: [
              PopupMenuButton<String>(
                onSelected: (String value) {
                  // Handle selection here
                  controller.setvalue(value);
                  AppPrint.appLog(value);
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem<String>(
                    value: 'active',
                    child: Text('Active'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'completed',
                    child: Text('Complete'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'booked',
                    child: Text('Substitute'),
                  ),
                ],
                child: Padding(
                  padding: EdgeInsets.only(right: AppSize.width(value: 16)),
                  child: AppImage(
                    path: AssetsPath.filter,
                    width: AppSize.width(value: 28),
                  ),
                ),
              ),
            ],
          ),

          body: Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: AppCard(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    Obx(() {
                      return SliverAppBar(
                        toolbarHeight: AppSize.size.height * 0.06,
                        pinned: true,
                        automaticallyImplyLeading: false,
                        backgroundColor: AppColor.white,
                        title: Column(
                          spacing: AppSize.size.height * 0.001,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.selectedValue.value == "active")
                              AppText(
                                data: "Active Shift",
                                fontSize: AppSize.width(value: 18),
                                fontWeight: FontWeight.w600,
                                color: AppColor.purple,
                              ),
                            if (controller.selectedValue.value == "completed")
                              AppText(
                                data: "Complete Shift",
                                fontSize: AppSize.width(value: 18),
                                fontWeight: FontWeight.w600,
                                color: AppColor.purple,
                              ),
                            if (controller.selectedValue.value == "booked")
                              AppText(
                                data: "Substitute Shift",
                                fontSize: AppSize.width(value: 18),
                                fontWeight: FontWeight.w600,
                                color: AppColor.purple,
                              ),
                          ],
                        ),
                      );
                    }),
                  ];
                },
                body: Obx(() {
                  return Column(
                    children: [
                      if (controller.selectedValue.value == "active")
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.jobsList.length,
                            itemBuilder: (context, index) {
                              final job = controller.jobsList[index];
                              return ClientHomeShiftCard(
                                name: job.title,
                                cirtificate: job.qualification,

                                date: job.startDate,
                                time: formatTimeRangeFromString(
                                  job.startTime ?? "",
                                  job.endTime ?? "",
                                ),
                                rateHourly: "\$${job.price.toString()}/hr",
                                // img: job.pr,
                              );
                            },
                          ),
                        ),
                      if (controller.selectedValue.value == "completed")
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.jobsList.length,
                            itemBuilder: (context, index) {
                              final job = controller.jobsList[index];
                              return ShiftCompleteCard(
                                title: job.title,
                                cirtificate: job.qualification,
                                startDate: job.startDate,
                                price: job.price.toString(),
                                img: job.jobImage,
                              );
                            },
                          ),
                        ),
                      if (controller.selectedValue.value == "booked")
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.jobsList.length,
                            itemBuilder: (context, index) {
                              return SubstituteCard(
                                onTap: () {
                                  Get.toNamed(
                                    AppRoutes
                                        .instance
                                        .clientAllSubstituteScreen,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                    ],
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
