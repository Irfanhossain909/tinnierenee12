import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/screen/auth/verify_otp_screen/controller/verify_otp_controller.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_loading/app_loading.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(18),
          child: AppImage(
            width: AppSize.width(value: 18),
            height: AppSize.width(value: 18),
            path: AssetsPath.arrowBack,
            iconColor: AppColor.white,
          ),
        ),
      ),
      body: GetBuilder<VerifyOtpController>(
        init: VerifyOtpController(),
        builder: (controller) {
          return Column(
            spacing: AppSize.size.height * 0.02,
            children: [
              AppImage(
                width: AppSize.width(value: 200),
                height: AppSize.width(value: 200),
                path: AssetsPath.otpImg,
              ),

              AppText(
                data: "Verification Code",
                fontSize: AppSize.width(value: 28),
                fontWeight: FontWeight.w700,
                color: AppColor.white,
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(value: 30),
                ),
                child: AppText(
                  data:
                      "We’ve sent a verification code to your email/phone. Enter the code below to continue and secure your account.",
                  textAlign: TextAlign.center,
                  fontSize: AppSize.width(value: 16),
                  fontWeight: FontWeight.w400,
                  color: AppColor.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    data: "We've Sent a Code to ",
                    fontSize: AppSize.width(value: 16),
                    fontWeight: FontWeight.w400,
                    color: AppColor.white,
                  ),
                  AppText(
                    data: controller.email,
                    fontSize: AppSize.width(value: 16),
                    fontWeight: FontWeight.w700,
                    color: AppColor.white,
                  ),
                ],
              ),

              Form(
                key: controller.formKey,
                child: PinCodeTextField(
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,

                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 46,
                    fieldWidth: 42,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveColor: AppColor.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: controller.otpTextEditingController,
                  appContext: context,
                  onCompleted: (code) {
                    controller.otpTextEditingController.text = code;
                  },
                ),
              ),

              Obx(() {
                if (controller.seconds.value == 0) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        data: "The code has expired",
                        color: AppColor.white,
                      ),
                      TextButton(
                        onPressed: () {
                          // controller.resendOtp();
                          controller.startTimer();
                        },
                        child: AppText(
                          data: "Resend",
                          color: AppColor.gold,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        data: "This code will expire in ",
                        color: AppColor.white,
                        textAlign: TextAlign.center,
                      ),
                      AppText(
                        data: controller.formatTime(controller.seconds.value),
                        color: AppColor.white,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }
              }),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(value: 16),
                ),
                child: AppButton(
                  onTap: () {
                    controller.emailVerify();
                  },
                  title: "Verify and Continue",
                  titleSize: AppSize.width(value: 18),
                ),
              ),

              Obx(() {
                return controller.isLoading.value
                    ? AppLoading()
                    : const SizedBox();
              }),
            ],
          );
        },
      ),
    );
  }
}
