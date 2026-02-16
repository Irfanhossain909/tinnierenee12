import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tinnierenee12/models/shift_model/my_shift_model.dart';
class EmployeeShiftDetailsController extends GetxController {
  Rxn<MyShiftModelData> myShiftModelData = Rxn<MyShiftModelData>();

  late GoogleMapController mapController;

  @override
  void onInit() {
    _dataRecived();
    super.onInit();
  }

  void _dataRecived() {
    var args = Get.arguments;
    myShiftModelData.value = args;
  }

 
}
