import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ix_task/presentation/resource/theme_manager.dart';
import 'package:ix_task/presentation/resource/routes_manager.dart';
import '../presentation/cubit/employee_cubit.dart';

class MyApp extends StatelessWidget {
  int appState = 0;

  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (context) => EmployeeCubit()..loadEmployees(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}