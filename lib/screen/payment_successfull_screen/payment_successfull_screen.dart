import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';

class PaymentSuccessfullScreen extends StatelessWidget {
  const PaymentSuccessfullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(value: 12),
          vertical: AppSize.width(value: 40),
        ),
        child: AppButton(
          onTap: () {
            Get.toNamed(AppRoutes.instance.navigationForClientScreen);
          },
          title: "Get Started",
        ),
      ),
      body: Center(
        child: AppImage(
          height: AppSize.size.height * 0.4,
          path: AssetsPath.paymentSuccessFullimg,
        ),
      ),
    );
  }
}
