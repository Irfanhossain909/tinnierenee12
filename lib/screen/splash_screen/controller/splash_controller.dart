import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class SplashController extends GetxController {
  RxDouble animation = 0.0.obs;
  RxDouble animation2 = 0.0.obs;

  Future<void> onInitialDataLoadScreen() async {
    try {
      Future.delayed(Durations.medium1, () {
        animation.value = 1.0;
        animation2.value = 1.0;
      });

      Future.delayed(Duration(seconds: 3), () {
        Get.delete<SplashController>();

        Get.toNamed(AppRoutes.instance.onBoardingScreen1);
        // // final String token = storageServices.getToken();
        // if (token.isNotEmpty) {
        //   Get.offAllNamed(AppRoutes.instance.navigationScreen);
        // } else {
        //   Get.offAllNamed(AppRoutes.instance.loginScreen);
        // }
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
