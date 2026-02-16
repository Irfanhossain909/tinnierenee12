import 'package:intl/intl.dart';

String formatDate(dynamic inputDate) {
  if (inputDate == null) return '';

  DateTime date;

  // যদি input ইতিমধ্যেই DateTime হয়
  if (inputDate is DateTime) {
    date = inputDate;
  } 
  // যদি input String হয়
  else if (inputDate is String) {
    try {
      date = DateTime.parse(inputDate);
    } catch (e) {
      return ''; // Invalid string date হলে empty return করবে
    }
  } 
  // অন্য কোন type হলে empty return
  else {
    return '';
  }

  // Date formatting
  final DateFormat formatter = DateFormat('MMM d, yyyy');
  return formatter.format(date);
}
