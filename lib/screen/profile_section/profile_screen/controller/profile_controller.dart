import 'package:get/get.dart';
import 'package:tinnierenee12/models/profile/profile_model.dart';
import 'package:tinnierenee12/service/api/get_storage_services.dart';
import 'package:tinnierenee12/service/repository/profile_repository.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class ProfileController extends GetxController {
  //repository
  GetStorageServices getStorage = GetStorageServices.instance;
  ProfileRepository profileRepository = ProfileRepository.instance;

  //variable
  RxBool isLoading = false.obs;
  Rxn<ProfileModelData> profileData = Rxn<ProfileModelData>();

  //Function
  //Get PRofile
  Future<void> fetchProfileData() async {
    try {
      isLoading.value = true;
      var response = await profileRepository.getProfileData();

      if (response != null) {
        profileData.value = response;
        isLoading.value = false;
      } else {
        AppPrint.appError("Response is null");
        isLoading.value = false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "ProfileController.fetchProfileData()");
    } finally {
      isLoading.value = false;
    }
  }

  //Logout
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

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }
}
