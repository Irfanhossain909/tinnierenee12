import 'package:intl/intl.dart';

class DateTimeFormatterPro {
  static String format(dynamic date) {
    try {
      // null or empty check
      if (date == null || date.toString().isEmpty) {
        return "Invalid";
      }

      // convert to DateTime
      DateTime? parsedDate = _toDateTime(date);
      if (parsedDate == null) {
        return "Invalid";
      }

      // format: Monday, September 22
      return DateFormat('EEEE, MMMM d').format(parsedDate);
    } catch (e) {
      return "Invalid";
    }
  }

  static DateTime? _toDateTime(dynamic input) {
    if (input is DateTime) {
      return input;
    } else if (input is String) {
      try {
        return DateTime.parse(input);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
}
