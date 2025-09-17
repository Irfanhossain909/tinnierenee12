import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_progress_bar.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class CustomAppBarAuth extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const CustomAppBarAuth({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        ProgressiveBorderContainer(
          progress: 60,
          width: 55,
          height: 55,
          borderRadius: 50, // Perfectly round
        ),
      ],
      centerTitle: true,
      title: AppText(
        data: title ?? "",
        fontSize: AppSize.width(value: 17),
        color: AppColor.white,
        fontWeight: FontWeight.w700,
      ),
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
