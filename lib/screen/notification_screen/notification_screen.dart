import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/screen/app_navigation_for_client_screen%20copy/controller/navigation_screen_for_client_controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_loading/app_loading.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final AppNavigationForClientController controller =
      Get.find<AppNavigationForClientController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Notification"),
      body: Obx(() {
        return Stack(
          children: [
            ListView.builder(
              controller: controller.scrollController,
              padding: EdgeInsets.only(top: AppSize.width(value: 10)),
              itemCount: controller.notificationList.length,
              itemBuilder: (context, index) {
                final notifications = controller.notificationList[index];
                return NotificationCard(
                  title: notifications.title,
                  message: notifications.text,
                  time: notifications.updatedAt.toString(),
                );
              },
            ),
            controller.isNotificationLoad.value ? AppLoading() : SizedBox(),
          ],
        );
      }),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String? title;
  final String? message;
  final String? time;
  const NotificationCard({super.key, this.title, this.message, this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.width(value: 16),
        vertical: AppSize.width(value: 4),
      ),
      child: Container(
        padding: EdgeInsets.all(AppSize.width(value: 16)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.white,
        ),
        child: Row(
          spacing: AppSize.width(value: 12),
          children: [
            Container(
              width: AppSize.width(value: 30),
              height: AppSize.width(value: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.purple.withValues(alpha: 0.3),
              ),
              child: Icon(
                Icons.notification_add,
                color: AppColor.purple.withValues(alpha: 0.7),
                size: 16, // Adjust the size as needed
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                spacing: AppSize.width(value: 8),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    data: title ?? "No Data",
                    fontSize: AppSize.width(value: 16),
                    fontWeight: FontWeight.w600,
                    color: AppColor.black,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppText(
                          data: message ?? "No Data",
                          fontSize: AppSize.width(value: 12),
                          fontWeight: FontWeight.w400,
                          color: AppColor.black,
                        ),
                      ),
                      AppText(
                        data: time ?? "No Data",
                        fontSize: AppSize.width(value: 12),
                        fontWeight: FontWeight.w500,
                        color: AppColor.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child:
            // ),
          ],
        ),
      ),
    );
  }
}
