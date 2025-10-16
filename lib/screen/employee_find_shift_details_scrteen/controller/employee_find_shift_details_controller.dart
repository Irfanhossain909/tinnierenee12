import 'package:get/get.dart';
import 'package:tinnierenee12/models/shift_model/find_shift_model.dart';
import 'package:tinnierenee12/screen/employee_find_shift_screen/controller/employee_find_shift_controller.dart';
import 'package:tinnierenee12/service/repository/shift_repository.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class EmployeeFindShiftDetailsController extends GetxController {
  Rxn<FindShiftModelData> findShiftList = Rxn<FindShiftModelData>();

  EmployeeFindShiftController employeeFindShiftController =
      Get.find<EmployeeFindShiftController>();

  final ShiftRepository shiftRepository = ShiftRepository.instance;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    findShiftList.value = Get.arguments;
    super.onInit();
  }

  Future<void> applyShift() async {
    try {
      isLoading.value = true;
      final response = await shiftRepository.applyShift(
        job: findShiftList.value?.id ?? "",
        status: "applied",
      );

      if (response) {
        /// ✅ API success hole locally status update kore dewa
        findShiftList.update((data) {
          if (data != null) {
            data.status = "booked";
          }
        });

        await employeeFindShiftController.fetchFindShift();

        AppPrint.apiResponse("Shift booked successfully", title: "apply shift");
      } else {
        AppPrint.appError("Something went wrong", title: "apply shift");
      }
    } catch (e) {
      AppPrint.appError(e, title: "apply shift");
    } finally {
      isLoading.value = false;
    }
  }
}



// import 'package:get/get.dart';
// import 'package:tinnierenee12/models/shift_model/find_shift_model.dart';
// import 'package:tinnierenee12/service/repository/shift_repository.dart';
// import 'package:tinnierenee12/widget/app_log/app_print.dart';

// class EmployeeFindShiftDetailsController extends GetxController {
//   Rxn<FindShiftModelData> findShiftList = Rxn<FindShiftModelData>();

//   ShiftRepository shiftRepository = ShiftRepository.instance;

//   @override
//   void onInit() {
//     findShiftList.value = Get.arguments;
//     super.onInit();
//   }

//   Future<void> applyShift() async{
//     try {
//       final response = await shiftRepository.applyShift(job: findShiftList.value?.id ?? "", status: "applied");
//       if (response) {
        
//       }else{
//         AppPrint.appError("Something went wrong",title: "apply shift");
//       }
//     } catch (e) {
//       AppPrint.appError(e,title: "apply shift");
//     }
//   }

  
// }
