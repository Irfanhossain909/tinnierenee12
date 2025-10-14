import 'package:get/get.dart';
import 'package:tinnierenee12/screen/app_navigation_for_client_screen%20copy/controller/navigation_screen_for_client_controller.dart';

import 'package:tinnierenee12/screen/profile_section/profile_screen/controller/profile_controller.dart';
import 'package:tinnierenee12/utils/location_utils/location_utils.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class EmployeeHomeController extends GetxController {
  ProfileController profileController = Get.find<ProfileController>();

  // RxString userAddress1 = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await profileController.fetchProfileData();
    userAddress.value = await getLocationFromLatLong(
      profileController.profileData.value?.latitude,
      profileController.profileData.value?.longitude,
    );

    AppPrint.apiResponse(profileController.profileData.value?.latitude);
    AppPrint.apiResponse(profileController.profileData.value?.longitude);
    AppPrint.apiResponse(profileController.profileData.value?.name);
  }
}
