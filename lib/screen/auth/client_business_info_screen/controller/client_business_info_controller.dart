import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/service/repository/profile_repository.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';
import 'package:tinnierenee12/widget/app_snackbar/app_snackbar.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

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
        image: cameraImage.value,
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

  ///////////////////////image////////////////////////////////////////

  RxString cameraImage = ''.obs;

  void removeImage() {
    cameraImage.value = "";
  }

  Future<void> getImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    // Request permission for camera
    PermissionStatus cameraPermission = await Permission.camera.request();

    // Check if permission is granted
    if (cameraPermission.isGranted) {
      // Show a dialog to choose between camera or gallery
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Choose Option".tr),
          content: Text("Select where you want to pick the image from:".tr),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                // Open the camera if the user selects camera
                final XFile? image = await picker.pickImage(
                  source: ImageSource.camera,
                  imageQuality: 5,
                );
                AppPrint.appLog(image);
                if (image != null) {
                  File file = File(image.path);
                  AppPrint.appLog(file);
                  AppPrint.appLog(file.runtimeType);
                  // Add image path to cameraImages list
                  cameraImage.value = file.path;
                }
              },
              child: AppText(
                data: "Camera",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                // Open the gallery if the user selects gallery (single image)
                final XFile? image = await picker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 5,
                );
                if (image != null) {
                  File file = File(image.path);
                  AppPrint.appLog(file);
                  AppPrint.appLog(file.runtimeType);

                  // Add image path to galleryImages list
                  cameraImage.value = image.path;
                }
              },
              child: AppText(
                data: "Gallery",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    } else {
      // If permission is denied, show a dialog and guide user to app settings
      if (cameraPermission.isDenied || cameraPermission.isPermanentlyDenied) {
        // Show a dialog explaining the need for the permission obo
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Permission Denied".tr),
            content: Text(
              "Camera permission is required to take a photo. Please enable it from the app settings."
                  .tr,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Open app settings
                  openAppSettings();
                },
                child: Text('Open Settings'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'.tr),
              ),
            ],
          ),
        );
      }
    }
  }

  //////////////////////////////////////////////////////////////////////

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
