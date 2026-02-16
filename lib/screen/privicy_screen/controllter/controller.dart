import 'package:get/get.dart';
import 'package:tinnierenee12/models/rules_model/rules_model.dart';
import 'package:tinnierenee12/service/repository/common_repository.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class Controller extends GetxController {
  RxBool isLoading = true.obs;
  CommonRepository commonRepository = CommonRepository.instance;
  Rxn<RulesModelData> rulsModel = Rxn<RulesModelData>();

  String? status;

  Future<void> fetchPrivacy() async {
    try {
      isLoading.value = true;
      final response = await commonRepository.getAppRules(status: status ?? "");
      if (response != null) {
        rulsModel.value = response;
      } else {
        AppPrint.appError("No Data Found", title: "fetchPrivacy");
      }
    } catch (e) {
      AppPrint.appError(e, title: "fetchPrivacy");
    }finally{
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    status = Get.arguments['status'];
    await fetchPrivacy();
    super.onInit();
  }
}
