import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgbe/core/routes/route_names.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      context.goNamed(RouteNames.onboarding);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Here our splash screens"),
      ),
    );
  }
}
