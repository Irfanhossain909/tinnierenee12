import 'package:intl/intl.dart';

String formatTimeRangeFromString(String? startTimeStr, String? endTimeStr) {
  // Null check
  if (startTimeStr == null || endTimeStr == null || startTimeStr.isEmpty || endTimeStr.isEmpty) {
    return "Time is not valid";
  }

  try {
    // Parse input strings to DateTime
    DateTime start = DateFormat("HH:mm").parse(startTimeStr);
    DateTime end = DateFormat("HH:mm").parse(endTimeStr);

    // Format to 12-hour AM/PM
    final DateFormat timeFormat = DateFormat.jm();
    String startStr = timeFormat.format(start);
    String endStr = timeFormat.format(end);

    // Calculate duration in hours
    double hours = end.difference(start).inMinutes / 60;
    String hoursStr = hours.toStringAsFixed(1);

    return '$startStr - $endStr ($hoursStr hours)';
  } catch (e) {
    // Error handling for invalid format
    return "Time is not valid";
  }
}
