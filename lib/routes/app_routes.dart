import 'package:flutter/material.dart';
import 'package:ndpc_gokyo/presentation/test/test.dart';
import '../presentation/Recharge/recharge_page.dart';
import '../presentation/pageLayout/page_layout.dart';
import 'route_path.dart';

class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    // route setting request cases
    switch (settings.name) {
      // case;
      case RoutesName.homePage_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => PageLayout());
      case RoutesName.recharge_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RechargeFormPage());
      case RoutesName.test_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TestPage());

      // if non of these above cases are met then return this
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("No route defined")),
          );
        });
    }
  }
}
