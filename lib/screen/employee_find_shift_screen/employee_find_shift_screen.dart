import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/employee_shift_screen/employee_shift_screen.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class EmployeeFindShiftScreen extends StatelessWidget {
  const EmployeeFindShiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        action: [
          Padding(
            padding: EdgeInsets.only(right: AppSize.width(value: 16)),
            child: AppImage(
              path: AssetsPath.filter,
              width: AppSize.width(value: 28),
            ),
          ),
        ],
        autoShowLeading: false,
        title: "Find Shift",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 16)),
        child: AppCard(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: AppSize.width(value: 12)),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColor.black.withValues(alpha: .1),
                      ),
                    ),
                    padding: EdgeInsets.all(AppSize.width(value: 16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: AppSize.width(value: 16),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              data: "123 Main St, Springfield",
                              fontSize: AppSize.width(value: 12),
                              fontWeight: FontWeight.w400,
                            ),
                            AppText(
                              data: "Shift Time & Date",
                              fontSize: AppSize.width(value: 14),
                              fontWeight: FontWeight.w700,
                            ),
                            Row(
                              spacing: AppSize.width(value: 4),
                              children: [
                                Icon(Icons.watch_later_outlined),
                                AppText(data: "09:00 - 17:00"),
                              ],
                            ),
                            Row(
                              spacing: AppSize.width(value: 4),
                              children: [
                                Icon(Icons.calendar_month_outlined),
                                AppText(data: "Monday, September 22"),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: AppSize.width(value: 8),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              data: r"$20/hr",
                              fontSize: AppSize.width(value: 18),
                              fontWeight: FontWeight.w700,
                              color: AppColor.gold,
                            ),
                            AppText(
                              data: "13 miles",
                              fontSize: AppSize.width(value: 14),
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
