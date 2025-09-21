import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_expanded_card/app_expanded_card.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_progress_bar.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class EmployeeHomeScreen extends StatelessWidget {
  const EmployeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 168,
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
            Gap(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6E6),
                border: Border.all(
                  color: const Color.fromARGB(255, 206, 53, 53),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: const Color(0xFFFFB3B3)),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Icon(Icons.close)),
                  ),
                  Gap(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          data: "You are unable to request shifts.",
                          fontSize: AppSize.width(value: 18),
                          fontWeight: FontWeight.w600,
                        ),
                        Gap(height: 4),
                        AppText(
                          data: "You have steps to complete below.",
                          fontSize: AppSize.width(value: 14),
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSize.width(value: 8),
          horizontal: AppSize.width(value: 16),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.white,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.purple.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColor.purple),
              ),
              padding: EdgeInsets.all(AppSize.width(value: 12)),
              child: AppImage(
                width: AppSize.width(value: 24),
                path: AssetsPath.identity,
              ),
            ),
            AppText(
              data: "My Document",
              fontSize: AppSize.width(value: 16),
              fontWeight: FontWeight.w700,
              color: AppColor.purple,
            ),
            Spacer(),
            Icon(Icons.add_circle_outline_rounded),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: AppCard(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyHeaderDelegate(
                    minHeight: AppSize.width(value: 60),
                    maxHeight: AppSize.width(value: 60),
                    child: Container(
                      decoration: BoxDecoration(color: AppColor.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: AppSize.width(value: 8),
                            children: [
                              AppText(
                                data: "Your Task List",
                                fontSize: AppSize.width(value: 16),
                                fontWeight: FontWeight.w600,
                                color: AppColor.purple,
                              ),
                              AppText(
                                data:
                                    "Complete these actions to begin working.",
                                fontSize: AppSize.width(value: 12),
                                fontWeight: FontWeight.w400,
                                color: AppColor.black,
                              ),
                            ],
                          ),

                          ProgressiveBorderContainer(
                            size: AppSize.size.width * 0.12,
                            progressColor: AppColor.purple,

                            progress: 80.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return AppExpandedCard(
                  leadingImage: Container(
                    decoration: BoxDecoration(
                      color: AppColor.purple.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColor.purple),
                    ),
                    padding: EdgeInsets.all(AppSize.width(value: 12)),
                    child: AppImage(
                      width: AppSize.width(value: 24),
                      path: AssetsPath.identity,
                    ),
                  ),
                  buttonText: "Submit",
                  buttonColor: AppColor.gold,

                  onButtonPressed: () {
                    Get.toNamed(AppRoutes.instance.employeePersonalInfoSubmitScreen1);
                  },

                  title: "Personal Information",
                  shortDescription: "Submit your personal details.",
                  longDescription:
                      "A background check is required to work at a licensed childcare center.",
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _StickyHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_StickyHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
