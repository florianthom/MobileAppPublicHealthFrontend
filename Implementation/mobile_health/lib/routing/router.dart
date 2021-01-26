import 'package:flutter/material.dart';
import 'package:mobile_health/screens/AddNewEntryCategoryScreen.dart';
import 'package:mobile_health/screens/AddNewEntryScreen.dart';
import 'package:mobile_health/screens/AddNewEntrySubCategoryScreen.dart';
import 'package:mobile_health/screens/ShowDiaryEntry.dart';

///
/// In addition to the default router with named-routes (not as a replacement), here we introduce
///   a additional router to handle route-parameters
/// used to push route-parameters e.g. from the addCategoryToEvent / addSubCategoryToEvent to the AddNewEntry-screen
///
/// route-parameter are handled by a Map
///
class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case '/addNewEventCategory':
        return MaterialPageRoute(builder: (_) => AddNewEntryCategoryScreen());

      case '/addNewEventCategory/addNewEventSubCategory':
        var data = settings.arguments as Map<String, dynamic>;
        var entryTypeFromRoute = data["entryTypeFromRoute"];
        return MaterialPageRoute(builder: (_) => AddNewEntrySubCategoryScreen(entryTypeFromRoute));

      case '/addNewEventCategory/addNewEventSubCategory/addNewEntry':
        var data = settings.arguments as Map<String, dynamic>;
        var parentEntryType = data["parentEntryType"];
        var subEntryType = data["subEntryType"];
        return MaterialPageRoute(builder: (_) => AddNewEntryScreen(parentEntryType, subEntryType));

      case "/diaryEntry":
        var data = settings.arguments as Map<String, dynamic>;
        var diaryEntry = data["diaryEntry"];
        return MaterialPageRoute(builder: (_) => ShowDiaryEntry(diaryEntry: diaryEntry));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}