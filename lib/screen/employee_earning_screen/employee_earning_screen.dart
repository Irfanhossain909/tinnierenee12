import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class EmployeeEarningScreen extends StatelessWidget {
  const EmployeeEarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "My Earning",
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
        padding: EdgeInsets.only(top: 16.0),
        child: AppCard(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColor.black.withValues(alpha: 0.1),
                      ),
                    ),
                    padding: EdgeInsets.all(AppSize.width(value: 12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: AppSize.size.height * 0.005,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText(
                          data: "Total Weekly Earnings",
                          fontSize: AppSize.width(value: 12),
                        ),
                        AppText(
                          data: r"$22,458.50",
                          fontSize: AppSize.width(value: 24),
                          fontWeight: FontWeight.w600,
                          color: AppColor.gold,
                        ),
                        Divider(color: AppColor.black),
                        AppText(
                          data: "Today Earnings",
                          fontSize: AppSize.width(value: 12),
                        ),
                        AppText(
                          data: r"$2,458.50",
                          fontSize: AppSize.width(value: 24),
                          fontWeight: FontWeight.w600,
                          color: AppColor.gold,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Gap(height: AppSize.width(value: 12)),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyHeaderDelegate(
                    minHeight: AppSize.width(value: 60),
                    maxHeight: AppSize.width(value: 60),
                    child: Container(
                      color: AppColor.white,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColor.black.withValues(alpha: 0.1),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: AppSize.width(value: 18),
                          horizontal: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AppText(
                                data: "Daycare Center",
                                fontSize: AppSize.width(value: 12),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(
                              child: AppText(
                                data: "Date",
                                fontSize: AppSize.width(value: 12),
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: AppText(
                                data: "Amount",
                                fontSize: AppSize.width(value: 12),
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Gap(height: AppSize.width(value: 12)),
                ),
              ];
            },
            body: ListView.builder(
              itemCount: 10, // Example data
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColor.black.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: AppSize.width(value: 16),
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppText(
                          data: "ABC Daycare ${index + 1}",
                          fontSize: AppSize.width(value: 12),
                        ),
                      ),
                      Expanded(
                        child: AppText(
                          data:
                              "2024-01-${(index + 1).toString().padLeft(2, '0')}",
                          fontSize: AppSize.width(value: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: AppText(
                          data: "\$${(250 + index * 50)}.00",
                          fontSize: AppSize.width(value: 12),
                          textAlign: TextAlign.end,
                          color: AppColor.gold,
                        ),
                      ),
                    ],
                  ),
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
