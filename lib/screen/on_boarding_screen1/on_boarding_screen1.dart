import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/const/assets_icons_path.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_button/app_button.dart';
import 'package:tinnierenee12/widget/app_image/app_image.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/routes/app_routes.dart';
import 'package:tinnierenee12/widget/appbar/custom_app_bar_auth.dart';

class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({super.key});

  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarAuth(
        action: [
          TextButton(
            onPressed: () {},
            child: AppText(
              data: "Skip",
              fontSize: AppSize.width(value: 16),
              color: AppColor.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: AppImage(
          path: AssetsPath.appLogo,
          width: AppSize.size.width * 0.65,
          // height: AppSize.size.width * 0.22,
          fit: BoxFit.contain,
        ),
      ),
      bottomNavigationBar: Container(
        height: AppSize.size.height * 0.35,
        padding: EdgeInsets.only(
          left: AppSize.width(value: 20),
          right: AppSize.width(value: 20),
          top: AppSize.width(value: 20),
          bottom: AppSize.width(value: 25),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.width(value: 16)),
            topRight: Radius.circular(AppSize.width(value: 16)),
          ),
          color: AppColor.white,
        ),
        child: Column(
          spacing: AppSize.size.height * 0.02,
          mainAxisSize: MainAxisSize.min,
          children: [
            _DotsIndicator(currentIndex: _currentIndex, total: 2),
            SizedBox(
              height: AppSize.size.height * 0.25,
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() => _currentIndex = value);
                },
                children: [
                  _OnboardPage(
                    title: "Welcome to EverBright",
                    description:
                        "Set up your profile to access shifts, track earnings, and connect with admins. Create your account, upload documents, and start managing your schedule.",
                    buttonLabel: "Next",
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  _OnboardPage(
                    title: "How It Works",
                    description:
                        "Set up your profile, browse available shifts, and accept with a tap. Track your earnings and stay connected with admins through real-time notifications.",
                    buttonLabel: "Get Started",
                    onPressed: () {
                      Get.toNamed(AppRoutes.instance.roleSelectionScreen);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardPage extends StatelessWidget {
  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback onPressed;

  const _OnboardPage({
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSize.size.height * 0.03,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          data: title,
          fontSize: AppSize.width(value: 20),
          color: AppColor.black,
          fontWeight: FontWeight.w600,
        ),
        AppText(
          textAlign: TextAlign.center,
          data: description,
          fontSize: AppSize.width(value: 16),
        ),
        Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: AppButton(
            onTap: onPressed,
            width: AppSize.size.width * 0.4,
            title: buttonLabel,
          ),
        ),
      ],
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int total;

  const _DotsIndicator({required this.currentIndex, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        final bool isActive = index == currentIndex;
        return Container(
          width: isActive ? AppSize.width(value: 30) : AppSize.width(value: 6),
          height: isActive ? AppSize.width(value: 6) : AppSize.width(value: 6),
          margin: EdgeInsets.symmetric(horizontal: AppSize.width(value: 6)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isActive ? AppColor.gold : AppColor.black.withOpacity(0.8),
            // shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
