import 'package:get/get.dart';
import 'package:tinnierenee12/screen/app_navigation_for_client_screen%20copy/controller/navigation_screen_for_client_controller.dart';
import 'package:tinnierenee12/screen/app_navigation_screen/controller/navigation_screen_controller.dart';
import 'package:tinnierenee12/screen/auth/location_screen/controller/location_controller.dart';
import 'package:tinnierenee12/screen/auth/personal_info_screen/controller/personal_info_controller.dart';
import 'package:tinnierenee12/screen/auth/client_business_info_screen/controller/client_business_info_controller.dart';
import 'package:tinnierenee12/screen/client_add_shift_screen/controller/client_add_new_shift_controller.dart';
import 'package:tinnierenee12/screen/client_all_substitute_screen/client_all_substitute_controller.dart';
import 'package:tinnierenee12/screen/client_home_screen/controller/client_home_controller.dart';
import 'package:tinnierenee12/screen/client_shift_screen/controller/client_shift_controller.dart';
import 'package:tinnierenee12/screen/employee_home_screen/controller/employee_home_controller.dart';
import 'package:tinnierenee12/screen/privicy_screen/controllter/controller.dart';
import 'package:tinnierenee12/screen/profile_section/chnage_pass_screen/controller/change_password_controller.dart';
import 'package:tinnierenee12/screen/profile_section/chnage_profile_info/controller/change_profile_controller.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/controller/profile_controller.dart';

class AppBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut(() => NavigationScreenController());
    Get.lazyPut(() => ClientHomeController());
    Get.lazyPut(() => AppNavigationForClientController());
    Get.lazyPut(() => PersonalInfoController());
    Get.lazyPut(() => ClientBusinessInfoController());
    Get.lazyPut(() => LocationController());
    Get.lazyPut(() => ClientShiftController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => ChangePasswordController());
    Get.lazyPut(() => ChangeProfileController());
    Get.lazyPut(() => ClientAddNewShiftController());
    Get.lazyPut(() => ClientAllSubstituteController());
    Get.lazyPut(() => Controller());
    Get.lazyPut(() => EmployeeHomeController());
  }
}
