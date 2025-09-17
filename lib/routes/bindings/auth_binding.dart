

import 'package:get/get.dart';
import 'package:tinnierenee12/screen/auth/sign_up_screen/controller/signup_controller.dart';

class AuthBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
