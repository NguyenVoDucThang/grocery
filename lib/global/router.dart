import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kid_shop/ui/screens/home_screen/home_screen.dart';
import 'package:kid_shop/ui/screens/sign_in_screen/sign_in_screen.dart';
import 'package:kid_shop/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:kid_shop/ui/screens/splash/splash_screen.dart';

class MyRouter {
  static const String homeScreen = '/homeScreen';
  static const String splashScreen = '/splashScreen';
  static const String signInScreen = '/signInScreen';
  static const String signUpScreen = '/signUpScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const HomeScreen(),
        );
      case splashScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SplashScreen(),
        );
      case signInScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SignInScreen(),
        );
      case signUpScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SignUpScreen(),
        );

      default:
        return _buildRouteNavigationWithoutEffect(
          settings,
          Scaffold(
            body: Center(
              child: Text('No route found: ${settings.name}.'),
            ),
          ),
        );
    }
  }

  static PageRouteBuilder _buildRouteNavigationWithoutEffect(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  static void onRouterChanged(String screenName) {}
}
