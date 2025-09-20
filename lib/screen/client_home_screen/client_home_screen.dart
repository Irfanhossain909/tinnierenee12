import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 88,
        backgroundColor: AppColor.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        title: Column(
          children: [
            Row(
              spacing: AppSize.size.width * 0.03,
              children: [
                AppImageCircular(
                  width: AppSize.width(value: 54),
                  height: AppSize.width(value: 54),
                  url:
                      "https://cdn.pixabay.com/photo/2023/12/04/17/16/woman-8429860_1280.jpg",
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      data: "Welcome, Sabbir!",
                      fontSize: AppSize.width(value: 24),
                      fontWeight: FontWeight.w600,
                    ),
                    Gap(height: AppSize.width(value: 4)),
                    Row(
                      children: [
                        AppImage(
                          path: AssetsPath.icLocation,
                          width: 16,
                          height: 16,
                          iconColor: AppColor.black,
                        ),
                        Gap(width: 6),
                        AppText(
                          data: "Los Angeles, California",
                          fontSize: AppSize.width(value: 16),
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.instance.notification);
                  },
                  child: Stack(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: AppColor.purple,
                        size: 32,
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: AppColor.gold,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: AppText(
                              data: "1",
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: AppCard(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSize.width(value: 4),
              children: [
                AppText(
                  data: "Statistics",
                  fontSize: AppSize.width(value: 18),
                  fontWeight: FontWeight.w600,
                  color: AppColor.purple,
                ),
                Gap(height: AppSize.size.height * 0.001),
                Row(
                  spacing: AppSize.size.width * 0.04,
                  children: [
                    Expanded(
                      child: ClientHomeCard(
                        text: "Total Spend",
                        text2: r"$4,250.75",
                      ),
                    ),
                    Expanded(
                      child: ClientHomeCard(
                        text: "Total Shift Completed",
                        text2: "15",
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: AppSize.size.width * 0.04,
                  children: [
                    Expanded(
                      child: ClientHomeCard(
                        text: "Running Shifts This Week",
                        text2: "2",
                      ),
                    ),
                    Expanded(
                      child: ClientHomeCard(
                        text: "Pending Invoices",
                        text2: "1",
                      ),
                    ),
                  ],
                ),
                Gap(height: AppSize.size.height * 0.001),
                AppText(
                  data: "Active Shift",
                  fontSize: AppSize.width(value: 18),
                  fontWeight: FontWeight.w600,
                  color: AppColor.purple,
                ),

                ClientHomeShiftCard(),
                ClientHomeShiftCard(),

                Align(
                  alignment: Alignment.centerRight,
                  child: AppText(
                    data: "See All",
                    fontSize: AppSize.width(value: 22),
                    fontWeight: FontWeight.w600,
                    color: AppColor.gold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClientHomeShiftCard extends StatelessWidget {
  const ClientHomeShiftCard({super.key});

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

                  Row(
                    spacing: AppSize.width(value: 4),
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      AppText(
                        data: "Tue, Sep 16, 2025",
                        fontSize: AppSize.width(value: 12),
                      ),
                    ],
                  ),
                  Row(
                    spacing: AppSize.width(value: 4),
                    children: [
                      Icon(Icons.watch_later_outlined),
                      AppText(
                        data: "8:00 AM - 5:00 PM (9.0 hours)",
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
                  Gap(height: AppSize.size.height * 0.07),
                  AppText(
                    data: r"$18/hr",
                    fontSize: AppSize.width(value: 14),
                    fontWeight: FontWeight.w700,
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

class ClientHomeCard extends StatelessWidget {
  final String? text;
  final String? text2;
  const ClientHomeCard({super.key, this.text, this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.black),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSize.size.height * 0.02,
        children: [
          AppText(
            data: text ?? "No Text",
            fontSize: AppSize.width(value: 16),
            color: AppColor.black,
          ),
          AppText(
            data: text2 ?? "No Text",
            fontSize: AppSize.width(value: 18),
            fontWeight: FontWeight.w600,
            color: AppColor.black,
          ),
        ],
      ),
    );
  }
}
