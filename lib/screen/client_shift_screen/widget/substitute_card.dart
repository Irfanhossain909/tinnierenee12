import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class SubstituteCard extends StatelessWidget {
  final String? startDate;
  final String? startTime;
  final String? endTime;
  final int? applicantCount;
  final VoidCallback? onTap;
  const SubstituteCard({
    super.key,
    this.onTap,
    required this.startDate,
    required this.startTime,
    required this.endTime,
    this.applicantCount,
  });

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
                    data: startDate,
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
                      data: "$applicantCount Applicants",
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
