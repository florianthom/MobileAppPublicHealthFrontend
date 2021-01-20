import 'package:flutter/material.dart';
import 'package:mobile_health/screens/AddNewEntryCategoryScreen.dart';
import 'package:mobile_health/screens/AddNewEntrySubCategoryScreen.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/addNewEventCategory':
        return MaterialPageRoute(builder: (_) => AddNewEntryCategoryScreen());
      case '/addNewEventSubCategory':
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => AddNewEntrySubCategoryScreen(data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}