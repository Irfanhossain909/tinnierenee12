import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/service/repository/profile_repository.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';
import 'package:tinnierenee12/widget/app_snackbar/app_snackbar.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

enum YesNo { yes, no }

class PersonalInfoController extends GetxController {
  final Rxn<YesNo> workedInChildCare = Rxn<YesNo>();

  bool isExperience = false;

  void setWorkedInChildCare(YesNo? value) {
    workedInChildCare.value = value;
    if (workedInChildCare.value == YesNo.yes) {
      isExperience = true;
    } else {
      isExperience = false;
    }

    AppPrint.appLog(isExperience);
  }

  //Repository
  ProfileRepository profileRepository = ProfileRepository.instance;

  //TextEditingControllers
  TextEditingController numberController = TextEditingController();
  TextEditingController refferCodeController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  //Loading state
  RxBool isLoading = false.obs;

  bool validation() {
    if (numberController.text.isEmpty) {
      AppSnackbar.error(title: "Error", message: "Please enter your number");
      return false;
    }
    if (refferCodeController.text.isEmpty) {
      AppSnackbar.error(
        title: "Error",
        message: "Please enter your Referr Code",
      );
      return false;
    }

    if (aboutMeController.text.isEmpty) {
      AppSnackbar.error(title: "Error", message: "Please write about yourself");
      return false;
    }
    return true;
  }

  Future<void> personalInfoUpdate() async {
    bool isValid = validation();

    if (!isValid) return;

    try {
      isLoading.value = true;
      var response = await profileRepository.updateUserProfile(
        image: cameraImage.value,
        bio: aboutMeController.text,
        contact: numberController.text,
        personalInformation: refferCodeController.text,
        workExperience: isExperience,
        birthDate: selectedDate.value,
      );
      if (response) {
        Get.offAllNamed(AppRoutes.instance.navigationForEmployeeScreen);
        AppSnackbar.success(
          title: "Update Success",
          message: "Your personal information has been updated",
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

  ////////////////////////////Date Picker////////////////////////////////
  var selectedDate = ''.obs; // selected date as string

  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // current date
      firstDate: DateTime(1900), // minimum date
      lastDate: DateTime.now(), // maximum date
    );

    if (pickedDate != null) {
      // Format date to "1990 - 05 - 15"
      String formattedDate = DateFormat('yyyy - MM - dd').format(pickedDate);
      selectedDate.value = formattedDate;
      debugPrint('Selected Date: $formattedDate');
      AppPrint.appLog(selectedDate.value);
    }
  }

  ////////////////////////////////////////////////////////////////////////////////
  //inisialize Contreoller
  void appInisializ() {
    numberController = TextEditingController();
    refferCodeController = TextEditingController();
    aboutMeController = TextEditingController();
  }

  //controller Dispose
  void appDispose() {
    numberController.dispose();
    refferCodeController.dispose();
    aboutMeController.dispose();
    cameraImage.value = "";
    isExperience = false;
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
