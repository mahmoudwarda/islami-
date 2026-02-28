import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main layout/main_layout.dart';
import '../../splash_route.dart';
import '../../sura_details_screen/sura_details_screen.dart';

class RoutesManager {
  static const String splashRoute = "/splashRoute";
  static const String mainLayout = "/mainLayout";
  static const String suraDetailsScreen = "/suraDetailsScreen";

  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return CupertinoPageRoute(builder: (_) => SplashRoute());

      case mainLayout:
        return CupertinoPageRoute(builder: (_) => MainLayout());

      case suraDetailsScreen:
        return CupertinoPageRoute(
          builder: (_) => const SuraDetailsScreen(),
          settings: settings,
        );

      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("Route Not Found")),
          ),
        );
    }
  }
}