import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/splash_screen/controller/splash_controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppSize.size = size;
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: AppImage(
                  path: AssetsPath.leftUp,
                  height: AppSize.size.height * 0.3,
                ),
              ),
              Obx(
                () => Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: AnimatedOpacity(
                      duration: Duration(seconds: 2),
                      opacity: controller.animation2.value,
                      child: AnimatedScale(
                        scale: controller.animation.value,
                        duration: Duration(seconds: 2),
                        curve: Curves.easeOutExpo,
                        child: Center(
                          child: AppImage(
                            path: AssetsPath.appLogo,
                            width: AppSize.size.width * 0.65,
                            // height: AppSize.size.width * 0.22,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: AppImage(
                  path: AssetsPath.rightDown,
                  height: AppSize.size.height * 0.3,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
