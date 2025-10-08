import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class ShiftCompleteCard extends StatelessWidget {
  final String? title;
  final String? cirtificate;
  final String? img;
  final String? price;
  final String? startDate;
  final bool isPaid;
  const ShiftCompleteCard({
    super.key,
    this.isPaid = false,
    this.title,
    this.cirtificate,
    this.img,
    this.startDate,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.width(value: 12)),
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
                  img ??
                  "https://cdn.pixabay.com/photo/2025/08/07/20/52/lighthouse-9761567_640.png",
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: AppSize.width(value: 8),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  data: title ?? "no text",
                  fontSize: AppSize.width(value: 18),
                  fontWeight: FontWeight.w700,
                ),
                AppText(
                  data: cirtificate ?? "no certificate",
                  fontSize: AppSize.width(value: 12),
                  fontWeight: FontWeight.w400,
                ),

                AppText(
                  data: price ?? r"$250",
                  fontSize: AppSize.width(value: 14),
                  fontWeight: FontWeight.w700,
                ),
                Row(
                  spacing: AppSize.width(value: 4),
                  children: [
                    Icon(Icons.calendar_month_outlined),
                    AppText(
                      data: startDate ?? "Shift on Wed, Sep 10, 2025",
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
    );
  }
}
