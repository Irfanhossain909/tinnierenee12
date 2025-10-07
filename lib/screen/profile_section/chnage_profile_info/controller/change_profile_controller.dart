import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tinnierenee12/const/app_api_end_point.dart';
import 'package:tinnierenee12/screen/auth/location_screen/controller/location_controller.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/controller/profile_controller.dart';
import 'package:tinnierenee12/service/repository/profile_repository.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';
import 'package:tinnierenee12/widget/app_snackbar/app_snackbar.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class ChangeProfileController extends GetxController {
  //text controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  //all repositories
  ProfileRepository profileRepository = ProfileRepository.instance;
  LocationController locationController = Get.put(LocationController());
  //loading state
  RxBool isLoading = false.obs;
  //profile update function
  Future<void> updateProfile() async {
    try {
      isLoading.value = true;

      // Convert birth date to proper format for API
      String? birthDateForApi;
      if (selectedStartDate.value.isNotEmpty &&
          selectedStartDate.value != 'Select Birth Date') {
        try {
          // Convert "yyyy - MM - dd" format to ISO date string
          String cleanDate = selectedStartDate.value.replaceAll(' - ', '-');
          DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(cleanDate);
          birthDateForApi = parsedDate.toIso8601String();
        } catch (e) {
          AppPrint.appError(e, title: "Date parsing error");
          birthDateForApi = null;
        }
      }

      var response = await profileRepository.updateUserProfile(
        name: nameController.text,
        latitude: locationController.selectedLatitude.value,
        longitude: locationController.selectedLongitude.value,
        contact: phoneController.text,
        bio: bioController.text,
        image: cameraImage.value,
        birthDate: birthDateForApi,
      );
      AppPrint.appLog("${AppApiEndPoint.domain}${cameraImage.value}");
      if (response) {
        AppSnackbar.success(
          title: "Success",
          message: "Profile updated successfully",
        );

        await profileController.fetchProfileData();
        Get.close(1);
      } else {
        Get.snackbar("Error", "Profile update failed");
        AppSnackbar.error(title: "Error", message: "Profile update failed");
        isLoading.value = false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "updateProfile");
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

  /////////////////////////select Dob////////////////////////////
  var selectedStartDate = ''.obs; // selected date as string

  Future<void> startDatePick(BuildContext context) async {
    // Parse existing date if available to set as initial date
    DateTime initialDate = DateTime.now();
    if (selectedStartDate.value.isNotEmpty &&
        selectedStartDate.value != 'Select Birth Date') {
      try {
        // Try to parse the existing date format "yyyy - MM - dd"
        String cleanDate = selectedStartDate.value.replaceAll(' - ', '-');
        initialDate = DateFormat('yyyy-MM-dd').parse(cleanDate);
      } catch (e) {
        // If parsing fails, use current date
        initialDate = DateTime.now();
      }
    }

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1950), // minimum date
      lastDate: DateTime.now(), // maximum date
    );

    if (pickedDate != null) {
      // Format date to "1990 - 05 - 15"
      String formattedDate = DateFormat('yyyy - MM - dd').format(pickedDate);
      selectedStartDate.value = formattedDate;
      debugPrint('Selected Birth Date: $formattedDate');
      AppPrint.appLog(selectedStartDate.value);
    }
  }
  ////////////////////////////////////////////

  ///controller initialization value
  void appInit() {
    final profile = profileController.profileData.value;

    // name
    if (nameController.text.isEmpty) {
      nameController.text = profile?.name ?? '';
    }

    // phone
    if (phoneController.text.isEmpty) {
      phoneController.text = profile?.contact ?? '';
    }

    // bio
    if (bioController.text.isEmpty) {
      bioController.text = profile?.bio ?? '';
    }

    // location (only if not already set)
    if (locationController.selectedLatitude.value == 0.0 &&
        locationController.selectedLongitude.value == 0.0) {
      locationController.selectedLatitude.value = profile?.latitude ?? 0.0;
      locationController.selectedLongitude.value = profile?.longitude ?? 0.0;
    }

    // image - keep cameraImage empty for server images
    // cameraImage should only contain local file paths when user selects new image
    // The UI will show server image when cameraImage is empty

    // birth date
    if (selectedStartDate.value.isEmpty) {
      if (profile?.birthDate != null && profile!.birthDate!.isNotEmpty) {
        // If profile has birth date, format it properly
        try {
          DateTime birthDate = DateTime.parse(profile.birthDate!);
          selectedStartDate.value = DateFormat(
            'yyyy - MM - dd',
          ).format(birthDate);
        } catch (e) {
          // If parsing fails, use the raw value or default
          selectedStartDate.value = profile.birthDate!.isNotEmpty
              ? profile.birthDate!
              : 'Select Birth Date';
        }
      } else {
        selectedStartDate.value = 'Select Birth Date';
      }
    }
  }

  ProfileController profileController = Get.put(ProfileController());

  @override
  void onInit() {
    super.onInit();
    // Ensure profile data is loaded before initializing form
    _initializeForm();
  }

  Future<void> _initializeForm() async {
    // Wait for profile data to be available
    if (profileController.profileData.value == null) {
      await profileController.fetchProfileData();
    }
    appInit();
  }
}
