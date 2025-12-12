import 'package:flutter/material.dart';

class NavigationUtil {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext? get currentContext => navigatorKey.currentContext;

  static Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static Future<dynamic> navigateToWithArguments(String routeName, arguments) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }
}
