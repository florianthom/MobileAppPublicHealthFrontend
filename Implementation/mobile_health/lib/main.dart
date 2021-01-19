import 'package:flutter/material.dart';
import 'package:mobile_health/bloc/navbar/navbar_bloc.dart';
import 'package:mobile_health/cubit/navbar/navbar_bloc.dart';
import 'package:mobile_health/cubit/observer/counter_observer.dart';
import 'package:mobile_health/screens/AddNewEntryCategoryScreen.dart';
import 'package:mobile_health/screens/CalenderScreen.dart';
import 'package:mobile_health/screens/HomePageScreen.dart';
import 'package:mobile_health/screens/MoreScreen.dart';
import 'package:mobile_health/screens/StatisticsScreen.dart';
import 'package:mobile_health/screens/loading.dart';
import "package:mobile_health/screens/InitialAppInstallationScreen.dart";
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_localizations.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final CounterCubit _counterBloc = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavbarBloc>(
        create: (context) => NavbarBloc(), //NavbarCubit(),
        ),
      ],
      child: MaterialApp(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('de', 'DE'),
        ],
        // These delegates make sure that the localization data for the proper language is loaded
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          // Check if the current device locale is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        theme: ThemeData(fontFamily: "Roboto"),
        home: Loading(),
        // initialRoute: "/",
        routes: {
          // "/": (context) => Loading(),
          "/home": (context) => HomePageScreen(),
          "/initialAppInstallationScreen": (context) =>
              InitialAppInstallationScreen(),
          "/statistics": (context) => StatisticsScreen(),
          "/more": (context) => MoreScreen(),
          "/calender": (context) => CalenderScreen(),
          "/addNewEventCategory": (context) => AddNewEntryCategoryScreen(),
        },
      ),
    );
  }
}
