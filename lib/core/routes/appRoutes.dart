import 'package:flutter/material.dart';
import 'package:personal_finance/screens/home.dart';
import 'package:personal_finance/screens/login.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return slideRoute(const LoginScreen());

      case home:
        return slideRoute(const homeScreen());

      default:
        return slideRoute(const LoginScreen());
    }
  }

  static PageRouteBuilder slideRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}
