import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class EmployeeShiftScreen extends StatelessWidget {
  const EmployeeShiftScreen({super.key});

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
        title: "My Shift",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 16)),
        child: AppCard(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return ShiftCard(
                onTap: () {
                  Get.toNamed(AppRoutes.instance.employeeShiftDetailsScreen);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class ShiftCard extends StatelessWidget {
  final Function()? onTap;
  const ShiftCard({super.key, this.onTap});

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
          child: Row(
            spacing: AppSize.width(value: 16),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImageCircular(
                fit: BoxFit.cover,
                width: AppSize.width(value: 46),
                height: AppSize.width(value: 46),
                url:
                    "https://cdn.pixabay.com/photo/2020/01/09/20/34/bmw-4753868_640.jpg",
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
                    data: "United States.",
                    fontSize: AppSize.width(value: 12),
                    fontWeight: FontWeight.w400,
                  ),
                  AppText(
                    data: r"$18/hr",
                    fontSize: AppSize.width(value: 14),
                    fontWeight: FontWeight.w700,
                  ),
                  Row(
                    spacing: AppSize.width(value: 4),
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      AppText(data: "Monday, September 22"),
                    ],
                  ),
                  Row(
                    spacing: AppSize.width(value: 4),
                    children: [
                      Icon(Icons.watch_later_outlined),
                      AppText(data: "09:00 - 17:00"),
                    ],
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
