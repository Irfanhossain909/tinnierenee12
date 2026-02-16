import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/screen/app_navigation_screen/controller/navigation_screen_controller.dart';
import 'package:tinnierenee12/screen/notification_screen/notification_screen.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_loading/app_loading.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class NotificationScreenForEmployee extends StatelessWidget {
  const NotificationScreenForEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationScreenController>(
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppbar(title: "Notification"),
          body: Obx(() {
            return RefreshIndicator(
              onRefresh: () async {
                controller.reffreshNotification();
              },
              child: Stack(
                children: [
                  if (controller.notificationList.isEmpty)
                    Center(
                      child: AppText(
                        data: "No Notification",
                        color: AppColor.white,
                      ),
                    ),
                  ListView.builder(
                    controller: controller.scrollController,
                    padding: EdgeInsets.only(top: AppSize.width(value: 10)),
                    itemCount: controller.notificationList.length,
                    itemBuilder: (context, index) {
                      final notifications = controller.notificationList[index];
                      return NotificationCard(
                        title: notifications.title,
                        message: notifications.text,
                        time: _formatTime(
                          notifications.updatedAt ?? DateTime.now(),
                        ),
                        isRead: notifications.read ?? false,
                        onTap: () {
                          if (notifications.read == true) {
                            AppPrint.appLog("no call");
                          } else {
                            controller.notificationList[index].read = true;
                            controller.update();
                            controller.updateNotification(
                              id: notifications.id ?? "",
                            );
                          }
                        },
                      );
                    },
                  ),
                  controller.isNotificationLoad.value
                      ? AppLoading()
                      : SizedBox(),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}

String _formatTime(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays > 0) {
    return '${difference.inDays} d';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} h';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} m';
  } else {
    return 'now';
  }
}
