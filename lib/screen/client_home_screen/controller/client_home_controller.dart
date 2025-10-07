import 'package:get/get.dart';
import 'package:tinnierenee12/screen/app_navigation_for_client_screen%20copy/controller/navigation_screen_for_client_controller.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/controller/profile_controller.dart';

class ClientHomeController extends GetxController {
  ProfileController profileController = Get.find<ProfileController>();
  AppNavigationForClientController navController =
      Get.find<AppNavigationForClientController>();
  RxString userAddress = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await profileController.fetchProfileData();
    // fetchAddressFromLatLng();
  }

  // // Reactive variables
  // var selectedLatitude = 0.0.obs;
  // var selectedLongitude = 0.0.obs;
  // var selectedAddress = ''.obs;

  // /// Fetch address from given lat & long
  // Future<void> fetchAddressFromLatLng() async {
  //   selectedLatitude.value = double.parse(
  //     profileController.profileData.value?.latitude ?? '0.0',
  //   );
  //   AppPrint.apiResponse(
  //     "latitude : ${profileController.profileData.value?.latitude}",
  //   );
  //   AppPrint.apiResponse(
  //     "longitude : ${profileController.profileData.value?.longitude}",
  //   );
  //   AppPrint.apiResponse(selectedAddress.value);
  //   selectedLongitude.value = double.parse(
  //     profileController.profileData.value?.longitude ?? '0.0',
  //   );
  //   AppPrint.apiResponse(selectedLongitude.value);

  //   // Call utility function
  //   String address = await LocationUtil.getAddressFromLatLng(
  //     selectedLatitude.value,
  //     selectedLongitude.value,
  //   );

  //   selectedAddress.value = address;
  //   AppPrint.apiResponse("address : $address");
  // }
}
