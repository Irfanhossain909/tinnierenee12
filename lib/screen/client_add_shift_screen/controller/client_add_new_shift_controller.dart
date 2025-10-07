import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class ClientAddNewShiftController extends GetxController {
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
var selectedEndTime = ''.obs;   // selected end time as string

Future<void> startTimePick(BuildContext context) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (pickedTime != null) {
    // Format time to "10:30 AM"
    final now = DateTime.now();
    final formattedTime = DateFormat('hh:mm a').format(
      DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute),
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
      DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute),
    );

    selectedEndTime.value = formattedTime;
    debugPrint('Selected End Time: $formattedTime');
    AppPrint.appLog(selectedEndTime.value);
  }
}
////////////////////////////////////////////////////////////////////////

}
