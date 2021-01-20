import 'package:flutter/material.dart';
import 'package:mobile_health/screens/AddNewEntryCategoryScreen.dart';
import 'package:mobile_health/screens/AddNewEntryScreen.dart';
import 'package:mobile_health/screens/AddNewEntrySubCategoryScreen.dart';

///*
class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/addNewEventCategory':
        return MaterialPageRoute(builder: (_) => AddNewEntryCategoryScreen());
      case '/addNewEventCategory/addNewEventSubCategory':
        var data = settings.arguments as Map<String, dynamic>;
        var categoryFromRoute = data["categoryFromRoute"];
        return MaterialPageRoute(builder: (_) => AddNewEntrySubCategoryScreen(categoryFromRoute));
      case '/addNewEventCategory/addNewEventSubCategory/addNewEntry':
        var data = settings.arguments as Map<String, dynamic>;
        var categoryFromRoute = data["categoryFromRoute"];
        var subCategoryFromRoute = data["subCategoryFromRoute"];
        return MaterialPageRoute(builder: (_) => AddNewEntryScreen(categoryFromRoute, subCategoryFromRoute));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}