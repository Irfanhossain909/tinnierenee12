import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/app_navigation_for_client_screen%20copy/controller/navigation_screen_for_client_controller.dart';
import 'package:tinnierenee12/screen/client_home_screen/client_home_screen.dart';

import 'package:tinnierenee12/screen/employee_earning_screen/employee_earning_screen.dart';
import 'package:tinnierenee12/screen/employee_find_shift_screen/employee_find_shift_screen.dart';
import 'package:tinnierenee12/screen/employee_home_screen/employee_home_screen.dart';
import 'package:tinnierenee12/screen/employee_shift_screen/employee_shift_screen.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/profile_screen.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';

class AppNavigationForClientScreen extends StatelessWidget {
  const AppNavigationForClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AppNavigationForClientController(),
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => IndexedStack(
              index: controller.selectedIndex.value,
              children: [
                ClientHomeScreen(),
                EmployeeShiftScreen(),

                EmployeeEarningScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.width(value: 20),
              vertical: AppSize.width(value: 20),
            ),
            child: Container(
              // margin: const EdgeInsets.all(16),
              padding: EdgeInsets.only(
                bottom: AppSize.width(value: 10),
                top: AppSize.width(value: 10),
              ),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(4, (index) {
                    final isSelected = controller.selectedIndex.value == index;
                    final iconPaths = [
                      AssetsPath.nav1,
                      AssetsPath.nav2,
                      AssetsPath.nav6,
                      AssetsPath.nav5,
                    ];

                    return InkWell(
                      onTap: () => controller.changeIndex(index),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: isSelected
                            ? BoxDecoration(
                                color: AppColor.gold, // Purple circle
                                shape: BoxShape.circle,
                              )
                            : null,
                        child: AppImage(
                          path: iconPaths[index],
                          width: AppSize.width(value: 24),
                          height: AppSize.width(value: 24),
                          iconColor: isSelected ? Colors.white : AppColor.black,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
