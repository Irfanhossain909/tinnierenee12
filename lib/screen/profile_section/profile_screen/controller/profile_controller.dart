import 'package:get/get.dart';
import 'package:tinnierenee12/service/api/get_storage_services.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class ProfileController extends GetxController {
  GetStorageServices getStorage = GetStorageServices.instance;
  RxBool isLoading = false.obs;
  void logout() {
    try {
      isLoading.value = true;
      getStorage.completeLogout();
    } catch (e) {
      AppPrint.appError(e, title: 'ProfileController.logout()');
    } finally {
      isLoading.value = false;
    }
  }
}
