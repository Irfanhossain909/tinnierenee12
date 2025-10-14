import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/models/notification_model/notification_model.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/controller/profile_controller.dart';
import 'package:tinnierenee12/service/repository/common_repository.dart';
import 'package:tinnierenee12/service/socket/socket_all_oparation.dart';
import 'package:tinnierenee12/utils/location_utils/location_utils.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

RxString userAddress = "".obs;

class AppNavigationForClientController extends GetxController {
  RxInt selectedIndex = RxInt(0);
  bool isExpanded = false;
  RxBool isHomeDataLoad = false.obs;
  int page = 1;
  int notificationPage = 1;
  RxBool isLastPage = false.obs;

  final ScrollController scrollController = ScrollController();

  AppSocketAllOperation appSocketAllOperation = AppSocketAllOperation.instance;

  CommonRepository commonRepository = CommonRepository.instance;
  ProfileController profileController = Get.find<ProfileController>();

  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(_notificationListener);
    await profileController.fetchProfileData();
    AppPrint.apiResponse(
      "lat long${profileController.profileData.value?.latitude},${profileController.profileData.value?.longitude}",
      title: "getLocationFromLatLong",
    );
    userAddress.value = await getLocationFromLatLong(
      profileController.profileData.value?.latitude,
      profileController.profileData.value?.longitude,
    );
    await fetchNotification();
    readSocketData();
  }

  ///////////////////////Notification////////////////
  RxInt notificationCount = 0.obs;
  RxList<NotificationModelData> notificationList =
      <NotificationModelData>[].obs;
  RxBool isNotificationLoad = false.obs;
  Future<void> fetchNotification() async {
    try {
      isNotificationLoad.value = true;
      final response = await commonRepository.getNotification(page: page);
      if (response.isNotEmpty) {
        notificationList.addAll(response);
        isLastPage.value = true;
      } else {
        AppPrint.appError("reswponse is null");
        isLastPage.value = false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "fetchNotification");
    } finally {
      isNotificationLoad.value = false;
    }
  }

  void readSocketData() {
    String _id = profileController.profileData.value?.id ?? "";
    appSocketAllOperation.readEvent(
      event: "get-notification::$_id",
      handler: (data) {
        AppPrint.appLog("Socket notification received: $data");
        // Handle the incoming notification data here
        // For example, add it to the notification list
        try {
          if (data != null) {
            // Parse and handle the notification data
            // You may need to convert data to NotificationModelData
            AppPrint.appLog("New notification: $data");
            // Optionally refresh the notification list
            fetchNotification();
            notificationCount.value++;
          }
        } catch (e) {
          AppPrint.appError(e, title: "readSocketData handler");
        }
      },
    );
  }
  //////////////////////////end/////////////////////

  void toggleExpansion() {
    isExpanded = !isExpanded;
    update(); // Notifies GetBuilder to rebuild
  }

  changeIndex(int index) {
    selectedIndex.value = index;
  }

  void _notificationListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (isLastPage.value) {
        page++;
        fetchNotification();
      }
    }
  }
}
