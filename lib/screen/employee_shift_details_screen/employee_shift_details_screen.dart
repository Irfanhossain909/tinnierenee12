import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class EmployeeShiftDetailsScreen extends StatelessWidget {
  const EmployeeShiftDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Shift Details"),
      body: Padding(
        padding: EdgeInsets.only(top: AppSize.width(value: 16)),
        child: AppCard(
          child: Column(
            spacing: AppSize.size.width * 0.01,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: AppSize.size.width * 0.03,
                children: [
                  AppImageCircular(
                    width: AppSize.width(value: 54),
                    height: AppSize.width(value: 54),
                    url:
                        "https://cdn.pixabay.com/photo/2024/07/06/04/27/map-8875910_1280.png",
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        data: "Sunny Smiles Daycare",
                        fontSize: AppSize.width(value: 24),
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(height: AppSize.width(value: 8)),
                      Row(
                        children: [
                          AppImage(
                            path: AssetsPath.icLocation,
                            width: 18,
                            height: 18,
                            iconColor: AppColor.black,
                          ),
                          Gap(width: 4),
                          SizedBox(
                            width: AppSize.size.width * 0.6,
                            child: AppText(
                              maxLines: 2,
                              data: "123 Meadow Lane, Springfield, IL 62704 ",
                              fontSize: AppSize.width(value: 12),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Gap(height: AppSize.width(value: 12)),
              AppText(
                data: "Shift Details",
                fontSize: AppSize.width(value: 16),
                fontWeight: FontWeight.w700,
                color: AppColor.purple,
              ),
              Gap(height: AppSize.width(value: 12)),
              AppText(
                data: r"$18/hr",
                fontSize: AppSize.width(value: 14),
                fontWeight: FontWeight.w700,
                color: AppColor.purple,
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
              Gap(height: AppSize.width(value: 12)),
              AppText(
                data: "Explore Daycare Center on the Map",
                fontSize: AppSize.width(value: 18),
                fontWeight: FontWeight.w700,
              ),

              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: AppImage(
                  width: AppSize.width(value: double.infinity),
                  height: AppSize.size.height * 0.23,
                  path: AssetsPath.map,
                ),
              ),
              Gap(height: AppSize.width(value: 12)),
              AppText(
                data: "My Working Day",
                fontSize: AppSize.width(value: 18),
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
