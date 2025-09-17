import 'package:get/get.dart';
import 'package:tinnierenee12/screen/auth/personal_info_screen/controller/personal_info_controller.dart';

class AppBinding extends Bindings {
  @override
  dependencies() {
    // Get.lazyPut(() => ThemeController());
    // Get.lazyPut(() => NotificationSettingController());
    Get.lazyPut(() => PersonalInfoController());
    
  }
}
