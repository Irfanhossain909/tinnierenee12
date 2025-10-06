import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/controller/profile_controller.dart';

class AppNavigationForClientController extends GetxController {
  RxInt selectedIndex = RxInt(0);
  bool isExpanded = false;
  RxBool isHomeDataLoad = false.obs;
  int page = 1;
  int notificationPage = 1;
  RxBool isLastPage = false.obs;

  final ScrollController scrollController = ScrollController();

  // final GetStorageServices getStorageServices = GetStorageServices.instance;

  void toggleExpansion() {
    isExpanded = !isExpanded;
    update(); // Notifies GetBuilder to rebuild
  }

  changeIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    Get.find<ProfileController>().fetchProfileData();
    super.onInit();
  }
}
