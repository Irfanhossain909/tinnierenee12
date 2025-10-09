import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_api_end_point.dart';
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
import 'package:tinnierenee12/widget/app_reffesh_indicator/app_reffesh_indicator.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';
import 'package:tinnierenee12/widget/app_loading/app_shimmer.dart';

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
                          child: controller.isLoadingJobs.value
                              ? ListView.builder(
                                  itemCount: 2, // Show 2 shimmer items
                                  itemBuilder: (context, index) {
                                    return AppShimmer();
                                  },
                                )
                              : AppReffeshIndicator(
                                  onRefresh: () async =>
                                      controller.jobListRefresh(),
                                  child: Obx(() {
                                    return ListView.builder(
                                      controller:
                                          controller.jobListStrollController,
                                      itemCount:
                                          controller.jobsList.length +
                                          (controller.isPaginationLoading.value
                                              ? 1
                                              : (controller
                                                        .isJobListMoreLoad
                                                        .value
                                                    ? 0
                                                    : 1)),
                                      itemBuilder: (context, index) {
                                        if (index <
                                            controller.jobsList.length) {
                                          final job =
                                              controller.jobsList[index];
                                          return ClientHomeShiftCard(
                                            name: job.title,
                                            cirtificate: job.qualification,

                                            date: job.startDate,
                                            time: formatTimeRangeFromString(
                                              job.startTime ?? "",
                                              job.endTime ?? "",
                                            ),
                                            rateHourly:
                                                "\$${job.price.toString()}/hr",
                                            img:
                                                "$AppApiEndPoint${job.jobImage}",
                                          );
                                        } else {
                                          // Show loading indicator for pagination
                                          if (controller
                                              .isPaginationLoading
                                              .value) {
                                            return const Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          } else if (!controller
                                              .isJobListMoreLoad
                                              .value) {
                                            return const Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Center(
                                                child: AppText(
                                                  data: "No more jobs",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColor.purple,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return const SizedBox.shrink();
                                          }
                                        }
                                      },
                                    );
                                  }),
                                ),
                        ),
                      if (controller.selectedValue.value == "completed")
                        Expanded(
                          child: controller.isLoadingCompleteJobs.value
                              ? ListView.builder(
                                  itemCount:
                                      2, // Show shimmer items for completed
                                  itemBuilder: (context, index) {
                                    return AppShimmer();
                                  },
                                )
                              : AppReffeshIndicator(
                                  onRefresh: () async =>
                                      controller.jobCompleteListRefresh(),
                                  child: Obx(() {
                                    return ListView.builder(
                                      controller: controller
                                          .jobCompleteListScrollController,
                                      itemCount:
                                          controller
                                              .jobBookedComplateList
                                              .length +
                                          (controller
                                                  .isPaginationLoadingComplete
                                                  .value
                                              ? 1
                                              : (controller
                                                        .isJobCompleteListMoreLoad
                                                        .value
                                                    ? 0
                                                    : 1)),
                                      itemBuilder: (context, index) {
                                        if (index <
                                            controller
                                                .jobBookedComplateList
                                                .length) {
                                          final job = controller
                                              .jobBookedComplateList[index];
                                          return ShiftCompleteCard(
                                            title: job.job?.title,
                                            cirtificate: job.job?.qualification,
                                            startDate: job.job?.startDate,
                                            price: job.job?.price.toString(),
                                            img: job.job?.jobImage,
                                            isPaid: job.isPaid ?? false,

                                            /// need data form backend
                                          );
                                        } else {
                                          // Show loading indicator for pagination
                                          if (controller
                                              .isPaginationLoadingComplete
                                              .value) {
                                            return const Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          } else if (!controller
                                              .isJobCompleteListMoreLoad
                                              .value) {
                                            return const Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Center(
                                                child: AppText(
                                                  data:
                                                      "No more completed jobs",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColor.purple,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return const SizedBox.shrink();
                                          }
                                        }
                                      },
                                    );
                                  }),
                                ),
                        ),
                      if (controller.selectedValue.value == "booked")
                        Expanded(
                          child: controller.isLoadingSubstituteJobs.value
                              ? ListView.builder(
                                  itemCount:
                                      2, // Show shimmer items for substitute
                                  itemBuilder: (context, index) {
                                    return AppShimmer();
                                  },
                                )
                              : AppReffeshIndicator(
                                  onRefresh: () async =>
                                      controller.jobSubstituteListRefresh(),
                                  child: Obx(() {
                                    return ListView.builder(
                                      controller: controller
                                          .jobSubstituteListScrollController,
                                      itemCount:
                                          controller.jobSubstituteList.length +
                                          (controller
                                                  .isPaginationLoadingSubstitute
                                                  .value
                                              ? 1
                                              : (controller
                                                        .isJobSubstituteListMoreLoad
                                                        .value
                                                    ? 0
                                                    : 1)),
                                      itemBuilder: (context, index) {
                                        if (index <
                                            controller
                                                .jobSubstituteList
                                                .length) {
                                          final item = controller
                                              .jobSubstituteList[index];
                                          return SubstituteCard(
                                            startTime: item.startTime,
                                            endTime: item.endTime,
                                            startDate: item.startDate,
                                            applicantCount: item.applicantCount,
                                            onTap: () {
                                              Get.toNamed(
                                                AppRoutes
                                                    .instance
                                                    .clientAllSubstituteScreen,
                                              );
                                            },
                                          );
                                        } else {
                                          // Show loading indicator for pagination
                                          if (controller
                                              .isPaginationLoadingSubstitute
                                              .value) {
                                            return const Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          } else if (!controller
                                              .isJobSubstituteListMoreLoad
                                              .value) {
                                            return const Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Center(
                                                child: AppText(
                                                  data:
                                                      "No more substitute jobs",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColor.purple,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return const SizedBox.shrink();
                                          }
                                        }
                                      },
                                    );
                                  }),
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
