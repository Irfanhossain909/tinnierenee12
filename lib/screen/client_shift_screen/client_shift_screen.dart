import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/screen/client_home_screen/client_home_screen.dart';
import 'package:tinnierenee12/screen/client_shift_screen/controller/client_shift_controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
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

                  // You can add your logic here based on the selected value
                  switch (value) {
                    case 'Active':
                      controller.setvalue(value);
                      AppPrint.appLog(value);
                      break;
                    case 'Complete':
                      controller.setvalue(value);
                      AppPrint.appLog(value);
                      break;
                    case 'Pending':
                      controller.setvalue(value);
                      AppPrint.appLog(value);
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem<String>(
                    value: 'Active',
                    child: Text('Active'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Complete',
                    child: Text('Complete'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Pending',
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
                            if (controller.selectedValue.value == "Active")
                              AppText(
                                data: "Active Shift",
                                fontSize: AppSize.width(value: 18),
                                fontWeight: FontWeight.w600,
                                color: AppColor.purple,
                              ),
                            if (controller.selectedValue.value == "Complete")
                              AppText(
                                data: "Complete Shift",
                                fontSize: AppSize.width(value: 18),
                                fontWeight: FontWeight.w600,
                                color: AppColor.purple,
                              ),
                            if (controller.selectedValue.value == "Pending")
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
                      if (controller.selectedValue.value == "Active")
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return ClientHomeShiftCard();
                            },
                          ),
                        ),
                      if (controller.selectedValue.value == "Complete")
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return ShiftCompleteCard();
                            },
                          ),
                        ),
                      if (controller.selectedValue.value == "Pending")
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
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

class SubstituteCard extends StatelessWidget {
  final VoidCallback? onTap;
  const SubstituteCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.width(value: 12)),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.black.withValues(alpha: .1)),
          ),
          padding: EdgeInsets.all(AppSize.width(value: 8)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: AppSize.width(value: 8),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    data: "Wed, Sep 17, 2025",
                    fontSize: AppSize.width(value: 18),
                    fontWeight: FontWeight.w700,
                  ),
                  AppImage(
                    path: AssetsPath.arrowRight,
                    width: AppSize.width(value: 20),
                    iconColor: AppColor.black,
                  ),
                ],
              ),
              AppText(
                data: "9:00 AM - 3:00 PM (6.0 hours)",
                fontSize: AppSize.width(value: 12),
                fontWeight: FontWeight.w400,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: AppText(
                      data: "Cancel Shift",
                      fontSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: AppText(
                      data: "3 Applicants",
                      fontSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w600,
                      color: AppColor.purple,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShiftCompleteCard extends StatelessWidget {
  final bool isPaid;
  const ShiftCompleteCard({super.key, this.isPaid = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.width(value: 12)),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.black.withValues(alpha: .1)),
          ),
          padding: EdgeInsets.all(AppSize.width(value: 8)),
          child: Row(
            spacing: AppSize.width(value: 16),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImageCircular(
                fit: BoxFit.cover,
                width: AppSize.width(value: 46),
                height: AppSize.width(value: 46),
                url:
                    "https://cdn.pixabay.com/photo/2025/08/07/20/52/lighthouse-9761567_640.png",
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: AppSize.width(value: 8),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    data: "Sunny Smiles Daycare",
                    fontSize: AppSize.width(value: 18),
                    fontWeight: FontWeight.w700,
                  ),
                  AppText(
                    data: "Lead Teacher Certified",
                    fontSize: AppSize.width(value: 12),
                    fontWeight: FontWeight.w400,
                  ),

                  AppText(
                    data: r"$250",
                    fontSize: AppSize.width(value: 14),
                    fontWeight: FontWeight.w700,
                  ),
                  Row(
                    spacing: AppSize.width(value: 4),
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      AppText(
                        data: "Shift on Wed, Sep 10, 2025",
                        fontSize: AppSize.width(value: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppImage(
                    path: AssetsPath.arrowRight,
                    width: AppSize.width(value: 20),
                    iconColor: AppColor.black,
                  ),
                  Gap(height: AppSize.size.height * 0.06),
                  if (isPaid)
                    AppText(
                      data: "Veiw Invoices",
                      fontSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w600,
                      color: AppColor.purple,
                    ),
                  if (!isPaid)
                    AppText(
                      data: "Pay Now",
                      fontSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
