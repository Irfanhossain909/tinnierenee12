import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class ShiftCard extends StatelessWidget {
  final String? imgPath;
  final String? title;
  final String? subTitle;
  final String? priceHoure;
  final String? date;
  final String? time;
  final bool isApproved;
  final Function()? onTap;
  const ShiftCard({
    super.key,
    this.onTap,
    this.imgPath,
    this.title,
    this.subTitle,
    this.priceHoure,
    this.date,
    this.time,
    this.isApproved = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.width(value: 12)),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isApproved
                ? Colors.redAccent.shade100.withValues(alpha: 0.1)
                : AppColor.white,
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
                    imgPath ??
                    "https://cdn.pixabay.com/photo/2020/01/09/20/34/bmw-4753868_640.jpg",
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: AppSize.width(value: 8),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    data: title ?? "Sunny Smiles Daycare",
                    fontSize: AppSize.width(value: 18),
                    fontWeight: FontWeight.w700,
                  ),
                  AppText(
                    data: subTitle ?? "United States.",
                    fontSize: AppSize.width(value: 12),
                    fontWeight: FontWeight.w400,
                  ),
                  AppText(
                    data: "\$$priceHoure/hr",
                    fontSize: AppSize.width(value: 14),
                    fontWeight: FontWeight.w700,
                  ),
                  Row(
                    spacing: AppSize.width(value: 4),
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      AppText(data: date ?? "Monday, September 22"),
                    ],
                  ),
                  Row(
                    spacing: AppSize.width(value: 4),
                    children: [
                      Icon(Icons.watch_later_outlined),
                      AppText(data: time ?? "09:00 - 17:00"),
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
