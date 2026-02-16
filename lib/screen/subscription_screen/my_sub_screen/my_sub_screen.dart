import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class MySubScreen extends StatelessWidget {
  const MySubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "My Subscription"),
      body: SizedBox(
        height: AppSize.size.height * 0.9,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (context, index) {
            return SizedBox(
              width: AppSize.size.width * 0.9,
              child: SubcriptionCard(onTap: () {}),
            );
          },
        ),
      ),
    );
  }
}

class SubcriptionCard extends StatelessWidget {
  final VoidCallback? onTap;
  const SubcriptionCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(AppSize.width(value: 16)),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .1), // Shadow color
                    offset: Offset(
                      0,
                      2,
                    ), // Vertical offset, giving shadow on bottom
                    blurRadius: 8, // Blur radius
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .1), // Shadow color
                    offset: Offset(
                      0,
                      -2,
                    ), // Vertical offset, giving shadow on top
                    blurRadius: 8, // Blur radius
                  ),
                ],
                borderRadius: BorderRadius.circular(AppSize.width(value: 12)),
                color: AppColor.white,
              ),

              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSize.size.height * 0.04,
                      horizontal: AppSize.size.width * 0.1,
                    ),
                    child: Column(
                      spacing: AppSize.size.height * 0.02,
                      children: [
                        AppImage(
                          width: AppSize.width(value: 40),
                          height: AppSize.width(value: 40),
                          path: AssetsPath.subIcon,
                        ),
                        AppText(
                          data: "Gold plan",
                          fontSize: AppSize.width(value: 18),
                          fontWeight: FontWeight.w700,
                          color: AppColor.gold,
                        ),
                        AppText(
                          data: r"$40/mth",
                          fontSize: AppSize.width(value: 40),
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        AppText(
                          data: "Billed annually.",
                          fontSize: AppSize.width(value: 16),
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        SubWidGetRow(text: "Advanced custom fields"),
                        SubWidGetRow(text: "Audit log and data history"),
                        SubWidGetRow(text: "Unlimited individual users"),
                        SubWidGetRow(text: "Unlimited individual data"),
                        SubWidGetRow(text: "Personalised+priotity service"),
                      ],
                    ),
                  ),
                  Container(
                    height: AppSize.height(value: 150),
                    width: AppSize.width(value: double.infinity),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppSize.width(value: 12)),
                        bottomRight: Radius.circular(AppSize.width(value: 12)),
                      ),
                      color: AppColor.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.width(value: 28),
                        vertical: AppSize.width(value: 44),
                      ),
                      child: AppButton(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.instance.paymentSuccessfullScreen,
                          );
                        },
                        borderRadius: BorderRadius.circular(12),
                        title: "Choose Plan",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubWidGetRow extends StatelessWidget {
  final String? text;
  const SubWidGetRow({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSize.width(value: 24),
      children: [
        AppImage(
          width: AppSize.width(value: 24),
          height: AppSize.width(value: 24),
          path: AssetsPath.right,
          color: AppColor.gold,
        ),
        AppText(
          data: text ?? "No Text",
          fontSize: AppSize.width(value: 16),
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ],
    );
  }
}
