import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/privicy_screen/controllter/controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_loading/app_loading.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class PrivicyScreen extends StatelessWidget {
  const PrivicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Get.arguments["title"];
    return GetBuilder<Controller>(
      init: Controller(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppbar(title: title ?? "Privacy Policy"),
          body: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: AppLoading());
            }

            return controller.rulsModel.value == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppImage(
                          width: AppSize.size.width * 0.6,
                          path: AssetsPath.termsImg,
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: AppSize.size.height * 0.03),
                    child: AppCard(
                      height: AppSize.size.height * 0.75,
                      child: SingleChildScrollView(
                        child: Html(
                          data: controller.rulsModel.value?.content,
                          // You'll need flutter_html package for this
                          // Or use Text widget if you want plain text
                        ),
                      ),
                    ),
                  );
          }),
        );
      },
    );
  }
}
