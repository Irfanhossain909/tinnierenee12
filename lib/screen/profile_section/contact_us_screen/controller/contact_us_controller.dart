import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/controller/profile_controller.dart';
import 'package:tinnierenee12/service/repository/common_repository.dart';
import 'package:tinnierenee12/widget/app_snackbar/app_snackbar.dart';

class ContactUsController extends GetxController {
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  CommonRepository commonRepository = CommonRepository.instance;
  ProfileController profileController = Get.find<ProfileController>();
  RxBool isLoading = false.obs;

  bool validation() {
    if (subjectController.text.isEmpty) {
      AppSnackbar.error(title: "Error", message: "Subject is required.");
      return false;
    }
    if (messageController.text.isEmpty) {
      AppSnackbar.error(title: "Error", message: "Message is required.");
      return false;
    }
    return true;
  }

  Future<void> sendContactUs() async {
    if (!validation()) {
      return;
    }
    isLoading.value = true;
    final response = await commonRepository.postCintactUs(
      subject: subjectController.text,
      message: messageController.text,
    );
    if (response) {
      AppSnackbar.success(
        title: "Success",
        message: "Your message has been sent successfully.",
      );
      clear();
      Get.close(1);
    } else {
      AppSnackbar.error(
        title: "Failed to Send",
        message: "Something went wrong. Please try again later.",
      );
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  void clear() {
    subjectController.clear();
    messageController.clear();
  }
}
