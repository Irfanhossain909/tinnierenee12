import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/role.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/service/repository/auth_repository.dart';
import 'package:tinnierenee12/service/repository/profile_repository.dart';
import 'package:tinnierenee12/service/storage_service/get_storage_services.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';
import 'package:tinnierenee12/widget/app_snackbar/app_snackbar.dart';

class SigninController extends GetxController {
  //// SignUp form Key
  GlobalKey signInFormKey = GlobalKey<FormState>();
  ////Text Editing Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //repository
  AuthRepository authRepository = AuthRepository.instance;
  ProfileRepository profileRepository = ProfileRepository.instance;
  GetStorageServices getStorageServices = GetStorageServices.instance;

  //variable
  var loading = false.obs;

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

  //Function
  Future<void> signin() async {
    try {
      loading.value = true;
      var response = await authRepository.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (response) {
        AppPrint.appLog("Signin Success");
        String role = await profileRepository.getUserRole() ?? '';

        if (role.isNotEmpty) {
          if (role == Role.CLIENT.name) {
            Get.offAllNamed(AppRoutes.instance.navigationForClientScreen);
          }
          if (role == Role.EMPLOYEE.name) {
            Get.offAllNamed(AppRoutes.instance.navigationForEmployeeScreen);
          }
          getStorageServices.setUserRole(role);
        } else {
          AppSnackbar.error(title: "Error", message: "Profile data is empty");
        }

        AppSnackbar.success(
          bgColor: AppColor.purple,
          textColor: AppColor.white,
          title: "Success",
          message: "You have successfully logged in!",
        );
      } else {
        loading.value = false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "signin");
    } finally {
      loading.value = false;
    }
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
