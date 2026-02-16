import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tinnierenee12/screen/app_navigation_for_client_screen%20copy/controller/navigation_screen_for_client_controller.dart';
import 'package:tinnierenee12/screen/auth/location_screen/controller/location_controller.dart';
import 'package:tinnierenee12/screen/client_home_screen/controller/client_home_controller.dart';
import 'package:tinnierenee12/screen/client_shift_screen/controller/client_shift_controller.dart';
import 'package:tinnierenee12/service/repository/job_repository.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';
import 'package:tinnierenee12/widget/app_snackbar/app_snackbar.dart';

class ClientAddNewShiftController extends GetxController {
  //Repository
  JobRepository jobRepository = JobRepository.instance;
  LocationController locationController = Get.find<LocationController>();
  AppNavigationForClientController appNavigationForClientController =
      Get.find<AppNavigationForClientController>();
  ClientHomeController clientHomeController = Get.find<ClientHomeController>();
  ClientShiftController clientShiftController = Get.find<ClientShiftController>();

  //TextEditingControllers
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionLicenseController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  //Loading state
  RxBool isLoading = false.obs;
  String selectedAgeGroup = '';
  bool validation() {
    if (titleController.text.isEmpty) {
      AppSnackbar.error(title: "Error", message: "Please enter job title");
      return false;
    }
    if (descriptionLicenseController.text.isEmpty) {
      AppSnackbar.error(
        title: "Error",
        message: "Please enter  job description",
      );
      return false;
    }

    if (qualificationController.text.isEmpty) {
      AppSnackbar.error(
        title: "Error",
        message: "Please enter required qualification",
      );
      return false;
    }

    if (selectedStartDate.value.isEmpty) {
      AppSnackbar.error(
        title: "Error",
        message: "Please select job start date",
      );
      return false;
    }

    if (selectedEndDate.value.isEmpty) {
      AppSnackbar.error(title: "Error", message: "Please select job end date");
      return false;
    }
    if (selectedEndTime.value.isEmpty) {
      AppSnackbar.error(title: "Error", message: "Please select job end time");
      return false;
    }
    if (selectedStartTime.value.isEmpty) {
      AppSnackbar.error(
        title: "Error",
        message: "Please select job start time",
      );
      return false;
    }
    if (priceController.text.isEmpty) {
      AppSnackbar.error(title: "Error", message: "Please enter job price");
      return false;
    }
    if (locationController.selectedLatitude.value == 0 ||
        locationController.selectedLongitude.value == 0) {
      AppSnackbar.error(title: "Error", message: "Please select job location");

      return false;
    }
    if (selectedAgeGroup.isEmpty) {
      AppSnackbar.error(title: "Error", message: "Please select job age group");
      return false;
    }

    return true;
  }

  Future<void> addjob() async {
    bool isValid = validation();
    if (!isValid) return;

    try {
      isLoading.value = true;
      final response = await jobRepository.addJob(
        title: titleController.text,
        description: descriptionLicenseController.text,
        qualification: qualificationController.text,
        ageGroup: selectedAgeGroup,
        price: int.parse(priceController.text),
        startDate: selectedStartDate.value,
        endDate: selectedEndDate.value,
        startTime: selectedStartTime.value,
        endTime: selectedEndTime.value,
        lat: locationController.selectedLatitude.value,
        lng: locationController.selectedLongitude.value,
      );
      if (response) {
        clearAllData();
        await clientHomeController.fetchJobData();
        await clientShiftController.fetchJobData(value: "active");
        AppSnackbar.success(
          title: "Success",
          message: "Job added successfully",
        );
        appNavigationForClientController.selectedIndex.value = 0;
      } else {
        AppSnackbar.error(title: "Error", message: "Something went wrong");
        isLoading.value = false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "add job");
      isLoading.value = false;
    }
  }

  ////////////////////////////Date Picker////////////////////////////////
  var selectedStartDate = ''.obs; // selected date as string
  var selectedEndDate = ''.obs; // selected date as string

  Future<void> startDatePick(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // current date
      firstDate: DateTime.now(), // minimum date
      lastDate: DateTime.now().add(const Duration(days: 365)), // maximum date
    );

    if (pickedDate != null) {
      // Format date to "1990 - 05 - 15"
      String formattedDate = DateFormat('yyyy - MM - dd').format(pickedDate);
      selectedStartDate.value = formattedDate;
      debugPrint('Selected Start Date: $formattedDate');
      AppPrint.appLog(selectedStartDate.value);

      // reset end date when start date changes
      selectedEndDate.value = '';
    }
  }

  Future<void> endDatePick(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime.now();

    // If start date is already selected
    if (selectedStartDate.value.isNotEmpty) {
      final start = DateTime.parse(
        selectedStartDate.value.replaceAll(' - ', '-'),
      );
      firstDate = start.add(const Duration(days: 1)); // next day of start date
      initialDate = firstDate; // show next day as default
    }

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      // Format date to "1990 - 05 - 15"
      String formattedDateEnd = DateFormat('yyyy - MM - dd').format(pickedDate);
      selectedEndDate.value = formattedDateEnd;
      debugPrint('Selected End Date: $formattedDateEnd');
      AppPrint.appLog(selectedEndDate.value);
    }
  }

  ////////////////////////////////////////////////////////////////////////

  ////////////////////////////Time Picker////////////////////////////////
  var selectedStartTime = ''.obs; // selected start time as string
  var selectedEndTime = ''.obs; // selected end time as string

  Future<void> startTimePick(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Format time to "10:30 AM"
      final now = DateTime.now();
      final formattedTime = DateFormat('hh:mm a').format(
        DateTime(
          now.year,
          now.month,
          now.day,
          pickedTime.hour,
          pickedTime.minute,
        ),
      );

      selectedStartTime.value = formattedTime;
      debugPrint('Selected Start Time: $formattedTime');
      AppPrint.appLog(selectedStartTime.value);

      // reset end time when start time changes
      selectedEndTime.value = '';
    }
  }

  Future<void> endTimePick(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Format time to "10:30 AM"
      final now = DateTime.now();
      final formattedTime = DateFormat('hh:mm a').format(
        DateTime(
          now.year,
          now.month,
          now.day,
          pickedTime.hour,
          pickedTime.minute,
        ),
      );

      selectedEndTime.value = formattedTime;
      debugPrint('Selected End Time: $formattedTime');
      AppPrint.appLog(selectedEndTime.value);
    }
  }

  ////////////////////////////////////////////////////////////////////////

  /// Clear all controller data
  void clearAllData() {
    // Clear text controllers
    titleController.clear();
    descriptionLicenseController.clear();
    qualificationController.clear();
    priceController.clear();

    // Reset observable variables
    selectedStartDate.value = '';
    selectedEndDate.value = '';
    selectedStartTime.value = '';
    selectedEndTime.value = '';

    // Reset age group selection
    selectedAgeGroup = '';

    // Reset loading state
    isLoading.value = false;

    // Clear location data from location controller
    locationController.selectedLatitude.value = 0.0;
    locationController.selectedLongitude.value = 0.0;
    locationController.selectedAddress.value = '';

    AppPrint.appLog('All controller data cleared successfully');
  }
}
