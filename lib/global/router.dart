import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:kid_shop/ui/screens/detail_product_screen/detail_product_screen.dart';
import 'package:kid_shop/ui/screens/home_screen/home_screen.dart';
import 'package:kid_shop/ui/screens/home_screen/widgets/cart_page.dart';
import 'package:kid_shop/ui/screens/home_screen/widgets/favorite_page.dart';
import 'package:kid_shop/ui/screens/oder_confirm_screen/order_confirm_screen.dart';
import 'package:kid_shop/ui/screens/order_confirmed_screen/order_confirmed_screen.dart';
import 'package:kid_shop/ui/screens/payment_screen/payment_screen.dart';
import 'package:kid_shop/ui/screens/sign_in_screen/sign_in_screen.dart';
import 'package:kid_shop/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:kid_shop/ui/screens/splash_screen/splash_screen.dart';

class MyRouter {
  static const String homeScreen = '/homeScreen';
  static const String splashScreen = '/splashScreen';
  static const String signInScreen = '/signInScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String detailProductScreen = '/detailProductScreen';
  static const String cartScreen = '/cartScreen';
  static const String orderConfirmScreen = '/orderConfirmScreen';
  static const String favoriteScreen = '/favoriteScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String orderConfirmedScreen = '/orderConfirmedScreen';

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
      case detailProductScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          DetailProductScreen(
            productDto: settings.arguments as ProductDto,
          ),
        );
      case cartScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const CartPage(),
        );
      case orderConfirmScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const OrderConfirmScreen(),
        );
      case favoriteScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const FavoritePage(),
        );
      case paymentScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const PaymentScreen(),
        );
      case orderConfirmedScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const OrderConfirmedScreen(),
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
