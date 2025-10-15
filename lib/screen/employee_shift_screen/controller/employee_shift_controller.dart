import 'package:get/get.dart';
import 'package:tinnierenee12/models/shift_model/my_shift_model.dart';
import 'package:tinnierenee12/service/repository/shift_repository.dart';
import 'package:tinnierenee12/utils/location_utils/location_utils.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class EmployeeShiftController extends GetxController {
  final ShiftRepository shiftRepository = ShiftRepository.instance;

  RxList<MyShiftModelData> myShiftModelData = <MyShiftModelData>[].obs;
  RxBool isLoading = false.obs;

  int page = 1;
  int limit = 10;

  @override
  void onInit() {
    super.onInit();
    fetchMyShiftList();
  }

  Future<void> fetchMyShiftList() async {
    isLoading.value = true;
    final response = await shiftRepository.getMyShift(page: page, limit: limit);
    if (response.isNotEmpty) {
      // ✅ প্রতিটা shift এর জন্য address resolve করে সেট করছি
      for (var shift in response) {
        final lat = shift.job?.lat;
        final long = shift.job?.lng;
        shift.job?.address = await locationFetch(lat: lat, long: long);
      }
      myShiftModelData.assignAll(response);
    } else {
      AppPrint.appError("MyShift is Empty now in controller");
    }
    isLoading.value = false;
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
}




// import 'package:get/get.dart';
// import 'package:tinnierenee12/models/shift_model/my_shift_model.dart';
// import 'package:tinnierenee12/service/repository/shift_repository.dart';
// import 'package:tinnierenee12/utils/location_utils/location_utils.dart';
// import 'package:tinnierenee12/widget/app_log/app_print.dart';

// class EmployeeShiftController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     fetchMyShiftList();
//   }

//   Future<String> locationFetch({
//     required dynamic lat,
//     required dynamic long,
//   }) async {
//     if (lat != "" && long != "") {
//       var userAddress = await getLocationFromLatLong(lat, long);
//       return userAddress;
//     }
//     return "No Address Found";
//   }

//   final ShiftRepository shiftRepository = ShiftRepository.instance;

//   RxList<MyShiftModelData> myShiftModelData = <MyShiftModelData>[].obs;
//   int page = 1;
//   int limit = 10;
//   Future<void> fetchMyShiftList() async {
//     final response = await shiftRepository.getMyShift(page: page, limit: limit);
//     if (response.isNotEmpty) {
//       myShiftModelData.addAll(response);
//     } else {
//       AppPrint.appError("MyShift is Empty now in controller");
//     }
//   }
// }
