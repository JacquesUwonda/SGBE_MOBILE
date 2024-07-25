import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgbe/core/routes/route_names.dart';
import 'package:sgbe/core/theme/app_color.dart';
import 'package:sgbe/core/utils_constants/app_string.dart';
import 'package:sgbe/core/widgets/rounded_elevated_button.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.goNamed(RouteNames.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Column(
        children: [
          const Text(
            AppString.sgbe,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            AppString.appDescription,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
            textAlign: TextAlign.justify,
          ),
          Positioned(
              bottom: 20,
              child: RoundedElevatedButton(
                buttonText: AppString.getStarted,
                onPressed: () => context.pushNamed(RouteNames.login),
              ))
        ],
      ),
    );
  }
}
