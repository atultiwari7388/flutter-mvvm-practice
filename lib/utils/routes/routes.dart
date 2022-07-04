import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/utils/routes/routes_name.routes.dart';
import 'package:mvvm_practice_app/view/Auth/signup/signup.auth.view.dart';
import '../../view/Auth/login/login_view.login.view.dart';
import '../../view/home/home_screen.home.view.dart';
import '../../view/splash/splash.view.dart';

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

      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
        );

      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
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
