import 'package:flutter/material.dart';
import 'package:ix_task/presentation/employee_data/employee_data.dart';
import 'package:ix_task/presentation/employee_list/employee_list_view.dart';
import 'package:ix_task/presentation/resource/string_manager.dart';

import '../../domain/model/employee_model.dart';
import '../splash/splash_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String usersListRoute = '/usersList';
  static const String userDataRoute = '/userData';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.usersListRoute:
        return MaterialPageRoute(builder: (_) => const EmployeeListScreen());

      case Routes.userDataRoute:
        final employee = settings.arguments as EmployeeModel;
        return MaterialPageRoute(
            builder: (_) => EmployeeData(employee: employee));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
