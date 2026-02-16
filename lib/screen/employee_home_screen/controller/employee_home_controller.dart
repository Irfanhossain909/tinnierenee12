import 'package:get/get.dart';
import 'package:tinnierenee12/screen/app_navigation_screen/controller/navigation_screen_controller.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/controller/profile_controller.dart';

class EmployeeHomeController extends GetxController {
  ProfileController profileController = Get.find<ProfileController>();

  NavigationScreenController navigationScreenController =
      Get.find<NavigationScreenController>();

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
