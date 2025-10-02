import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  //// SignUp form Key
  final GlobalKey signUpFormKey = GlobalKey<FormState>();
  ////Text Editing Controller

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    inisializedController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  ////Validator Function
  // Email Validator Function
  String? validateEmail(String? email) {
    // Null ba empty check
    if (email == null || email.isEmpty) {
      return 'Please enter a valid email';
    }

    // Email regex pattern
    final RegExp emailRegex = RegExp(
      r'^[\w\-\.]+@[\w\-]+\.[\w]{2,3}(\.[\w]{2,3})?$',
    );

    // Regex match check
    final bool isEmailValid = emailRegex.hasMatch(email);

    if (!isEmailValid) {
      return 'Please enter a valid email';
    }

    return null; // Valid hole null return korbe
  }

  // Password Validator Function
  String? validatePassword(String? password) {
    // Null ba empty check
    if (password == null || password.isEmpty) {
      return 'Please enter a password';
    }

    // Minimum length check (minimum 6 characters)
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    // Optional: Strong password check
    // At least one uppercase, one lowercase, one digit
    final bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    final bool hasDigit = password.contains(RegExp(r'[0-9]'));

    if (!hasUppercase || !hasLowercase || !hasDigit) {
      return 'Password must contain uppercase, lowercase and number';
    }

    return null; // Valid hole null return korbe
  }

  void inisializedController() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
}
