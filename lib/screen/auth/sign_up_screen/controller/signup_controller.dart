import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/role.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/screen/role_selection_screen/role_selection_screen.dart';
import 'package:tinnierenee12/service/repository/auth_repository.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class SignUpController extends GetxController {
  // Observable variable for checkbox state
  var isChecked = false.obs;

  // Function to toggle the checkbox value
  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }

  AuthRepository authRepository = AuthRepository.instance;
  // Rxn allows the value to be null or a valid Role.
  final Rxn<Role> userRole = Rxn<Role>();

  //TextEditingControllers
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //validate function

  // Validate First Name
  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Name";
    } else if (value.length < 3) {
      return "Name should be at least 3 characters long";
    } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return "Enter a valid name (letters and spaces only)";
    }
    return null;
  }

  // // Validate Address
  // String? validateAddress(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return "Enter Address";
  //   } else if (value.length < 5) {
  //     return "Address should be at least 5 characters long";
  //   }
  //   return null;
  // }

  // Validate Email
  String? validateEmail(String? value) {
    bool emailValid = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(value ?? "");
    if (value == null || value.isEmpty) {
      return "Enter Email";
    } else if (!emailValid) {
      return "Enter a valid Email";
    }
    return null;
  }

  // Validate Phone Number
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Phone Number";
    } else if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
      // Assuming phone numbers between 10 to 15 digits
      return "Enter a valid Phone Number";
    }
    return null;
  }

  // Validate Password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Password";
    } else if (value.length < 8) {
      return "Password length should be more than 8 characters";
    }
    return null;
  }

  String? validateRePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Password";
    } else if (value.length < 8) {
      return "Password length should be more than 8 characters";
    }
    return null;
  }

  //Loading state
  RxBool isLoading = false.obs;

  // Signup function
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        // Show loading state
        isLoading.value = true;

        // Make the sign-up request to the repository
        var response = await authRepository.signUp(
          name: fullNameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
          role: rollSelected,

          // role: userRole.value!.name,
        );

        if (response) {
          Get.toNamed(
            AppRoutes.instance.verifyOtpScreen,
            arguments: emailController.text,
          );
        } else {
          isLoading.value = false;
          Get.snackbar("Error", "Sign-up failed. Please try again.");
        }
      } catch (e) {
        // Handle any errors that occur during the sign-up process
        AppPrint.appError(e, title: "SignUpController");
        Get.snackbar("Error", "An error occurred during sign-up.");
      } finally {
        // Hide loading state
        isLoading.value = false;
      }
    }
  }

  // Setter function to set the value of workedInChildCare
  void setUserRole(Role? value) {
    userRole.value = value;
    AppPrint.apiResponse(userRole.value?.name, title: "Updated Role");
  }

  //inisialize Contreoller
  void appInisializ() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    fullNameController = TextEditingController();
  }

  //controller Dispose
  void appDispose() {
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    fullNameController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    appInisializ();
  }

  @override
  void onClose() {
    appDispose();
    super.onClose();
  }
}
