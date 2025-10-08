// import 'package:intl/intl.dart';

// String calculateDateDifference(String startDate, String endDate) {
//   try {
//     // Parse safely
//     DateTime start = DateTime.parse(startDate.replaceAll(' ', ''));
//     DateTime end = DateTime.parse(endDate.replaceAll(' ', ''));

//     // Ensure start <= end
//     if (end.isBefore(start)) {
//       final temp = start;
//       start = end;
//       end = temp;
//     }

//     // Duration difference
//     Duration diff = end.difference(start);
//     int days = diff.inDays;

//     // Format dates → "Sep 6, 2020"
//     final dateFormat = DateFormat('MMM d, yyyy');
//     String formattedStart = dateFormat.format(start);
//     String formattedEnd = dateFormat.format(end);

//     String durationText = "";

//     // 1️⃣ Less than 7 days → only days
//     if (days < 7) {
//       durationText = "$days day${days > 1 ? 's' : ''}";
//     }
//     // 2️⃣ 7–29 days → week + day
//     else if (days < 30) {
//       int weeks = days ~/ 7;
//       int remainingDays = days % 7;
//       durationText = "$weeks week${weeks > 1 ? 's' : ''}";
//       if (remainingDays > 0) {
//         durationText += " $remainingDays day${remainingDays > 1 ? 's' : ''}";
//       }
//     }
//     // 3️⃣ 30–364 days → month + day
//     else if (days < 365) {
//       int months = days ~/ 30;
//       int remainingDays = days % 30;
//       durationText = "$months month${months > 1 ? 's' : ''}";
//       if (remainingDays > 0) {
//         durationText += " $remainingDays day${remainingDays > 1 ? 's' : ''}";
//       }
//     }
//     // 4️⃣ 365+ days → year + month + day
//     else {
//       int years = days ~/ 365;
//       int remainingDays = days % 365;
//       int months = remainingDays ~/ 30;
//       int extraDays = remainingDays % 30;

//       durationText = "$years year${years > 1 ? 's' : ''}";
//       if (months > 0) {
//         durationText += " $months month${months > 1 ? 's' : ''}";
//       }
//       if (extraDays > 0) {
//         durationText += " $extraDays day${extraDays > 1 ? 's' : ''}";
//       }
//     }

//     // 🧾 Final formatted text
//     return "$formattedStart - $formattedEnd ($durationText)";
//   } catch (e) {
//     return "Invalid date format";
//   }
// }
