import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/auth/location_screen/controller/location_controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_loading/app_loading.dart';
import 'package:tinnierenee12/widget/app_location_field/PlacesSuggation.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:tinnierenee12/widget/appbar/custom_app_bar_auth.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBarAuth(),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              AppImage(
                width: AppSize.width(value: 200),
                height: AppSize.width(value: 200),
                path: AssetsPath.locationImg,
              ),

              AppText(
                data: "Set Your Location",
                fontSize: AppSize.width(value: 28),
                fontWeight: FontWeight.w700,
                color: AppColor.white,
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSize.width(value: 12),
                  horizontal: AppSize.width(value: 40),
                ),
                child: AppText(
                  data:
                      "To help us connect you with nearby service providers or customers, please allow access to your location.",
                  textAlign: TextAlign.center,
                  fontSize: AppSize.width(value: 16),
                  fontWeight: FontWeight.w400,
                  color: AppColor.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppSize.width(value: 12)),

                child: Column(
                  spacing: AppSize.size.height * 0.02,
                  children: [
                    Obx(() {
                      return controller.isLoading.value
                          ? AppLoading()
                          : GestureDetector(
                              onTap: () async {
                                await controller.fetchUserLocation();
                              },
                              child: Container(
                                width: AppSize.width(value: double.infinity),
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColor.white,
                                ),
                                child: Center(
                                  child: AppText(
                                    data: "Allow Location Access",
                                    fontSize: AppSize.width(value: 12),
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                  ),
                                ),
                              ),
                            );
                    }),
                    Obx(
                      () => PlaceAutocompleteWidget(
                        controller: controller.searchController,
                        hintText: 'Enter location',
                        borderWidth: 0.9,
                        showCurrentLocation: controller.hasLocationData,
                        currentLocationAddress:
                            controller.selectedAddress.value.isNotEmpty
                            ? controller.selectedAddress.value
                            : null,
                        currentLocationLat:
                            controller.selectedLatitude.value != 0.0
                            ? controller.selectedLatitude.value
                            : null,
                        currentLocationLng:
                            controller.selectedLongitude.value != 0.0
                            ? controller.selectedLongitude.value
                            : null,
                        onPlaceSelected:
                            (
                              placeId,
                              description, {
                              isCurrentLocation = false,
                              lat,
                              lng,
                            }) {
                              controller.onPlaceSelected(
                                placeId,
                                description,
                                isCurrentLocation: isCurrentLocation,
                                lat: lat,
                                lng: lng,
                              );
                            },
                      ),
                    ),
                    AppButton(
                      width: double.infinity,
                      onTap: () {},
                      title: "Continue",
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
