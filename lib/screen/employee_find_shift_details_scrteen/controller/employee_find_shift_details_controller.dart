import 'package:get/get.dart';
import 'package:tinnierenee12/models/shift_model/find_shift_model.dart';

class EmployeeFindShiftDetailsController extends GetxController {
  Rxn<FindShiftModelData> findShiftList = Rxn<FindShiftModelData>();

  @override
  void onInit() {
    findShiftList.value = Get.arguments;
    super.onInit();
  }

  
}
