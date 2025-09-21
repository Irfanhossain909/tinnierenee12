import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_card/app_card.dart';
import 'package:tinnierenee12/widget/app_image/app_image_circular.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_appbar.dart';

class ClientAllSubstituteScreen extends StatelessWidget {
  const ClientAllSubstituteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "All Substitute", autoShowLeading: false),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 16)),
        child: AppCard(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: AppSize.width(value: 12)),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColor.black.withValues(alpha: .1),
                      ),
                    ),
                    padding: EdgeInsets.all(AppSize.width(value: 8)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppImageCircular(
                          fit: BoxFit.cover,
                          width: AppSize.width(value: 46),
                          height: AppSize.width(value: 46),
                          url:
                              "https://cdn.pixabay.com/photo/2025/08/07/20/52/lighthouse-9761567_640.png",
                        ),
                        Gap(width: AppSize.width(value: 8)),
                        Expanded(
                          child: Column(
                            spacing: AppSize.width(value: 8),
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                data: "Maria Garcia",
                                fontSize: AppSize.width(value: 18),
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                data: "Lead Teacher",
                                fontSize: AppSize.width(value: 12),
                                fontWeight: FontWeight.w400,
                              ),
                              AppText(
                                data: "Certified",
                                fontSize: AppSize.width(value: 12),
                                fontWeight: FontWeight.w400,
                              ),
                              AppText(
                                data: "Worked here 1 time",
                                fontSize: AppSize.width(value: 12),
                                fontWeight: FontWeight.w400,
                                color: AppColor.purple,
                              ),
                              // Buttons moved here at the bottom
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: AppText(
                                        data: "Reject",
                                        fontSize: AppSize.width(value: 12),
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: AppText(
                                        data: "Accept",
                                        fontSize: AppSize.width(value: 12),
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.purple,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
