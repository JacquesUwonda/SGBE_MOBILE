import 'package:go_router/go_router.dart';
import 'package:sgbe/core/routes/route_names.dart';
import 'package:sgbe/futures/auth/view/login_view.dart';
import 'package:sgbe/futures/auth/view/present_auth_view.dart';
import 'package:sgbe/futures/auth/view/register_view.dart';
import 'package:sgbe/futures/splash/view/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: RouteNames.splash,
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      name: RouteNames.onboarding,
      path: "/onboarding",
      builder: (context, state) => const onboarding(),
    ),
    GoRoute(
      name: RouteNames.login,
      path: "/login",
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      name: RouteNames.register,
      path: "/register",
      builder: (context, state) => const RegisterView(),
    ),
  ],
);
