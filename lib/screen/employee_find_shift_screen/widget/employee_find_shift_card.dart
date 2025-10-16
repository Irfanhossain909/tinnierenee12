import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class EmployeeFindShiftCard extends StatelessWidget {
  final String? title;
  final String? address;
  final String? startTime;
  final String? endTime;
  final String? startDate;
  final String? endDate;
  final String? price;
  final String? distance;
  final Function()? onTap;
  const EmployeeFindShiftCard({
    super.key,
    this.onTap,
    this.title,
    this.address,
    this.startDate,
    this.endDate,
    this.price,
    this.distance,
    this.startTime,
    this.endTime,
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
                    data: title ?? "no Data",
                    fontSize: AppSize.width(value: 18),
                    fontWeight: FontWeight.w700,
                  ),
                  AppText(
                    data: address ?? "no Data",
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
                      AppText(data: "$startTime - $endTime"),
                    ],
                  ),
                  Row(
                    spacing: AppSize.width(value: 4),
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      AppText(data: startDate ?? "no data"),
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
                    data: "\$${price ?? 0}/hr",
                    fontSize: AppSize.width(value: 18),
                    fontWeight: FontWeight.w700,
                    color: AppColor.gold,
                  ),
                  AppText(
                    data: "${distance ?? 0} miles",
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
  }
}
