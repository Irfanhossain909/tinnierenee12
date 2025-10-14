import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/models/notification_model/notification_model.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/controller/profile_controller.dart';
import 'package:tinnierenee12/service/repository/common_repository.dart';
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

  // final GetStorageServices getStorageServices = GetStorageServices.instance;

  CommonRepository commonRepository = CommonRepository.instance;
  ProfileController profileController = Get.find<ProfileController>();

  @override
  void onInit() async {
    super.onInit();

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
  }

  ///////////////////////Notification////////////////
  RxList<NotificationModelData> notificationList =
      <NotificationModelData>[].obs;
  Future<void> fetchNotification() async {
    try {
      final response = await commonRepository.getNotification(page: page);
      if (response.isNotEmpty) {
        notificationList.addAll(response);
      } else {
        AppPrint.appError("reswponse is null");
      }
    } catch (e) {
      AppPrint.appError(e, title: "fetchNotification");
    }
  }
  //////////////////////////end/////////////////////

  void toggleExpansion() {
    isExpanded = !isExpanded;
    update(); // Notifies GetBuilder to rebuild
  }

  changeIndex(int index) {
    selectedIndex.value = index;
  }
}
