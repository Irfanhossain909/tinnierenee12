import 'package:get/get.dart';

class ClientShiftController extends GetxController {
  RxString selectedValue = "".obs;

  void setvalue(value) {
    selectedValue.value = value;
  }

  @override
  void onInit() {
    selectedValue.value = "Active";
    super.onInit();
  }
}
