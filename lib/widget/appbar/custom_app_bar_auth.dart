import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';

class CustomAppBarAuth extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(18),
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: AppImage(
            width: AppSize.width(value: 18),
            height: AppSize.width(value: 18),
            path: AssetsPath.arrowBack,
            iconColor: AppColor.white,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
