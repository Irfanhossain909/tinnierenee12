import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/models/shift_model/find_shift_model.dart';
import 'package:tinnierenee12/screen/app_navigation_screen/controller/navigation_screen_controller.dart';
import 'package:tinnierenee12/service/repository/shift_repository.dart';
import 'package:tinnierenee12/utils/location_utils/location_utils.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class EmployeeFindShiftController extends GetxController {
  List<String> ageGroup = <String>["school", "infant", "pre-school", "toddle"];
  RxInt selectedIndex = 0.obs;
  NavigationScreenController navigationScreenController =
      Get.find<NavigationScreenController>();
  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(_findScrollerListener);
    // Wait for profile data to be available
    await _storeData();
    fetchFindShift();
    AppPrint.apiResponse(lat, title: "lat");
    AppPrint.apiResponse(lng, title: "lng");
  }

  ///////////////distance function
  RxDouble progressValue = 30.0.obs;

  void updateDistance(double value) {
    progressValue.value = value;
  }

  ///////////////price/hr function
  RxDouble priceValue = 100.0.obs;

  void updatePrice(double value) {
    priceValue.value = value;
  }

  ////repository
  final ShiftRepository shiftRepository = ShiftRepository.instance;
  RxList<FindShiftModelData> findShiftList = <FindShiftModelData>[].obs;
  final ScrollController scrollController = ScrollController();
  RxBool isLoading = false.obs;
  RxBool isMoreDataAvailable = true.obs;
  int page = 1;
  int limit = 10;
  double? lat;
  double? lng;

  Future<void> fetchFindShift() async {
    try {
      isLoading.value = true;
      final response = await shiftRepository.getFindShift(
        page: page,
        limit: limit,
        lat: lat ?? 0.0,
        lng: lng ?? 0.0,
        distance: progressValue.value,
        price: priceValue.value.toInt(),
      );

      if (response.isNotEmpty) {
        for (var shift in response) {
          final lat = shift.lat;
          final long = shift.lng;
          shift.address = await locationFetch(lat: lat, long: long);
        }
        findShiftList.addAll(response);
      } else {
        AppPrint.appError("No data");
        isMoreDataAvailable.value = false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "fetchFindShift");
    } finally {
      isLoading.value = false;
    }
  }

  void refreshFindShift() {
    page = 1;
    isMoreDataAvailable.value = true;
    findShiftList.clear();
    fetchFindShift();
  }

  Future<String> locationFetch({
    required dynamic lat,
    required dynamic long,
  }) async {
    if (lat != "" && long != "") {
      var userAddress = await getLocationFromLatLong(lat, long);
      return userAddress;
    }
    return "No Address Found";
  }

  Future<void> _storeData() async {
    // Ensure profile data is loaded
    if (navigationScreenController.profileController.profileData.value ==
        null) {
      await navigationScreenController.profileController.fetchProfileData();
    }

    // Now safely get lat/lng
    lat =
        navigationScreenController
            .profileController
            .profileData
            .value
            ?.latitude ??
        0.0;
    lng =
        navigationScreenController
            .profileController
            .profileData
            .value
            ?.longitude ??
        0.0;

    AppPrint.apiResponse("Lat/Lng stored: $lat, $lng", title: "_storeData");
  }

  void _findScrollerListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (isMoreDataAvailable.value) {
        page++;
        fetchFindShift();
      }
    }
  }
}
