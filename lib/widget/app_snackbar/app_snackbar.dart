import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color purple = Color(0xFF2C2A5B);
  static const Color black = Color(0xFF100F0E);
  static const Color gold = Color(0xFFCDA861);
}

class AppSnackbar {
  // ✅ Success Snackbar
  static void success({
    required String title,
    required String message,
    Color? bgColor,
    Color? textColor,
    Color? iconColor,
    IconData? icon,
    Duration? duration,
    SnackPosition? position,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: position ?? SnackPosition.TOP,
      backgroundColor: bgColor ?? const Color(0xFFFFF9E6), // soft golden
      colorText: textColor ?? AppColors.purple,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      duration: duration ?? const Duration(seconds: 2),
      icon: Icon(
        icon ?? Icons.check_circle,
        size: 24,
        color: iconColor ?? AppColors.gold,
      ),
    );
  }

  // ❌ Error Snackbar
  static void error({
    required String title,
    required String message,
    Color? bgColor,
    Color? textColor,
    Color? iconColor,
    IconData? icon,
    Duration? duration,
    SnackPosition? position,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: position ?? SnackPosition.TOP,
      backgroundColor: bgColor ?? const Color(0xFFFFE6E6), // soft red
      colorText: textColor ?? AppColors.purple,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      duration: duration ?? const Duration(seconds: 2),
      icon: Icon(icon ?? Icons.error, size: 24, color: iconColor ?? Colors.red),
    );
  }
}
