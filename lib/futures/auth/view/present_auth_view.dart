import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgbe/core/routes/route_names.dart';
import 'package:sgbe/core/theme/app_color.dart';
import 'package:sgbe/core/utils_constants/app_string.dart';
import 'package:sgbe/core/widgets/custom_image_form.dart';
import 'package:sgbe/core/widgets/rounded_elevated_button.dart';

class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40,
        ),
        child: Column(
          children: [
            AppImage.onboardingImage,
            const Text(
              AppString.sgbe,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 50,
                  color: AppColor.whiteColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              AppString.appDescription,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                  color: AppColor.whiteColor),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedElevatedButton(
              buttonText: AppString.getStarted,
              onPressed: () {
                context.pushNamed(RouteNames.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
