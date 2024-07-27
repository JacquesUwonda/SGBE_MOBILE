import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgbe/bloc/bloc/login_bloc.dart';
import 'package:sgbe/core/routes/routes.dart';
import 'package:sgbe/core/utils_constants/app_string.dart';
import 'package:sgbe/data/repository/authRepository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => LoginBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        child: MaterialApp.router(
          theme: ThemeData(
            fontFamily: 'Mitr',
          ),
          debugShowCheckedModeBanner: false,
          title: AppString.appName,
          // theme: AppTheme.darkThemeMode,
          routerConfig: router,
        ),
      ),
    );
  }
}
