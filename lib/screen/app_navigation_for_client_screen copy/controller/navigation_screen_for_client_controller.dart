import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/models/notification_model/notification_model.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/controller/profile_controller.dart';
import 'package:tinnierenee12/service/repository/common_repository.dart';
import 'package:tinnierenee12/service/socket/socket_all_oparation.dart';
import 'package:tinnierenee12/utils/location_utils/location_utils.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class AppNavigationForClientController extends GetxController {
  RxInt selectedIndex = RxInt(0);
  bool isExpanded = false;
  RxBool isHomeDataLoad = false.obs;
  int page = 1;
  int notificationPage = 1;
  RxBool isLastPage = false.obs;
  RxString userAddress = "".obs;
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

  Future<void> updateNotification({required String id}) async {
    try {
      final response = await commonRepository.updateNotificationStatus(id: id);
      if (response) {
        AppPrint.appLog("Notification updated successfully");
      }
    } catch (e) {
      AppPrint.appError(e, title: "updateNotification");
    }
  }

  void reffreshNotification() async {
    try {
      notificationList.clear();
      page = 1;
      isLastPage.value = false;
      await fetchNotification();
    } catch (e) {
      AppPrint.appError(e, title: "refreshNotification");
    }
  }

  void readSocketData() {
    String _id = profileController.profileData.value?.id ?? "";

    appSocketAllOperation.readEvent(
      event: "get-notification::$_id",
      handler: (data) {
        AppPrint.appLog("Socket notification received: $data");

        try {
          if (data != null) {
            // 1️⃣ Parse socket data to NotificationModelData
            NotificationModelData newNotification =
                NotificationModelData.fromJson(data);

            // 2️⃣ Insert new notification at the beginning of the list
            notificationList.insert(0, newNotification);

            // 3️⃣ Optionally update unread count
            notificationCount.value++;

            AppPrint.appLog("New notification added: ${newNotification.title}");
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
