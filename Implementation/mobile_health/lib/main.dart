import 'package:flutter/material.dart';
import 'package:mobile_health/screens/HomePageScreen.dart';
import 'package:mobile_health/screens/loading.dart';
import "package:mobile_health/screens/InitialAppInstallationScreen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "Roboto"),
        initialRoute: "/",
        routes: {
          "/": (context) => Loading(),
          "/home": (context) => HomePageScreen(),
          "/initialAppInstallationScreen": (context) => InitialAppInstallationScreen(),
        }
    );
  }
}