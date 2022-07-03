import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/utils/routes/routes_name.routes.dart';
import '../../view/home/home_screen.home.view.dart';
import '../../view/login/login_view.login.view.dart';

class Routes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Screen does not exist!'),
            ),
          ),
        );
    }
  }
}
