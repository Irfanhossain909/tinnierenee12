import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class EmployeeHomeScreen extends StatelessWidget {
  const EmployeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
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
                        AppImageCircular(
                          path: AssetsPath.icLocation,
                          width: 16,
                          height: 16,
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
                      Icon(Icons.notifications, color: AppColor.purple, size: 32),
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

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColor.white,
          ),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 100,
                color: Colors.blue[100],
              );
            },
          ),
        ),
      ),
    );
  }
}
