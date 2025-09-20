import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/client_home_screen/client_home_screen.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class ClientShiftScreen extends StatelessWidget {
  const ClientShiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "My Shift",
        autoShowLeading: false,
        action: [
          Padding(
            padding: EdgeInsets.only(right: AppSize.width(value: 16)),
            child: AppImage(
              path: AssetsPath.filter,
              width: AppSize.width(value: 28),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: AppCard(
          child: SingleChildScrollView(
            child: Column(
              spacing: AppSize.size.height * 0.001,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  data: "Active Shift",
                  fontSize: AppSize.width(value: 18),
                  fontWeight: FontWeight.w600,
                  color: AppColor.purple,
                ),
                ClientHomeShiftCard(),
                ClientHomeShiftCard(),
                ClientHomeShiftCard(),
                ClientHomeShiftCard(),
                ClientHomeShiftCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
