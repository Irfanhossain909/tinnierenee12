import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/service/repository/profile_repository.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';
import 'package:tinnierenee12/widget/app_snackbar/app_snackbar.dart';

class ClientBusinessInfoController extends GetxController {
  //Repository
  ProfileRepository profileRepository = ProfileRepository.instance;

  //TextEditingControllers
  TextEditingController nameController = TextEditingController();
  TextEditingController stateLicenseController = TextEditingController();
  TextEditingController weblinkController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  //Loading state
  RxBool isLoading = false.obs;

  bool validation() {
    if (nameController.text.isEmpty) {
      AppSnackbar.error(
        title: "Error",
        message: "Please enter your Business name",
      );
      return false;
    }
    if (stateLicenseController.text.isEmpty) {
      AppSnackbar.error(
        title: "Error",
        message: "Please enter your state license",
      );
      return false;
    }

    if (aboutMeController.text.isEmpty) {
      AppSnackbar.error(title: "Error", message: "Please enter your about me");
      return false;
    }
    return true;
  }

  Future<void> centerInfoUpdate() async {
    bool isValid = validation();

    if (!isValid) return;

    try {
      isLoading.value = true;
      var response = await profileRepository.updateUserProfile(
        bio: aboutMeController.text,
        websiteLink: weblinkController.text,
        businessInformation: nameController.text,
        licenseId: stateLicenseController.text,
      );
      if (response) {
        Get.offAllNamed(AppRoutes.instance.navigationForClientScreen);
        AppSnackbar.success(
          title: "Update Success",
          message: "Your business profile has been updated",
        );
      } else {
        AppPrint.appError("response is false");
        isLoading.value = false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "centerInfoUpdate");
    } finally {
      isLoading.value = false;
    }
  }

  //inisialize Contreoller
  void appInisializ() {
    nameController = TextEditingController();
    stateLicenseController = TextEditingController();
    weblinkController = TextEditingController();
    aboutMeController = TextEditingController();
  }

  //controller Dispose
  void appDispose() {
    nameController.dispose();
    stateLicenseController.dispose();
    weblinkController.dispose();
    aboutMeController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    appInisializ();
  }

  @override
  void onClose() {
    appDispose();
    super.onClose();
  }
}
