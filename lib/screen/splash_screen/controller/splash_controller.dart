import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/role.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/service/storage_service/get_storage_services.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class SplashController extends GetxController {
  RxDouble animation = 0.0.obs;
  RxDouble animation2 = 0.0.obs;

  // service
  GetStorageServices getStorageServices = GetStorageServices.instance;

  Future<void> onInitialDataLoadScreen() async {
    try {
      Future.delayed(Durations.medium1, () {
        animation.value = 1.0;
        animation2.value = 1.0;
      });

      Future.delayed(Duration(seconds: 3), () {
        Get.delete<SplashController>();

        final String token = getStorageServices.getToken();
        final String role = getStorageServices.getUserRole();
        if (token.isNotEmpty) {
          if (role == Role.CLIENT.name) {
            Get.toNamed(AppRoutes.instance.navigationForClientScreen);
          } else if (role == Role.EMPLOYEE.name) {
            Get.toNamed(AppRoutes.instance.navigationForEmployeeScreen);
          } else {
            Get.toNamed(AppRoutes.instance.onBoardingScreen1);
          }
        } else {
          Get.toNamed(AppRoutes.instance.onBoardingScreen1);
        }
      });
    } catch (e) {
      AppPrint.appError(e, title: "onInitialDataLoadScreen");
    }
  }

  @override
  void onInit() {
    onInitialDataLoadScreen();
    super.onInit();
  }
}
