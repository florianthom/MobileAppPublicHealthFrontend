import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_health/bloc/navbar/navbar_bloc.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_bloc.dart';
import 'package:mobile_health/components/MoreOptionBox.dart';
import 'package:mobile_health/screens/HomePageScreen.dart';
import 'package:mobile_health/screens/MoreScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_health/statistics/Statistics.dart';
import 'package:scidart/numdart.dart';

///
///
/// Test Strategies
///
///
/// Integration Tests:
///   For the given timeframe and the current state of the app
///   proper integration testing was not possible.
///
/// Unit Tests:
///   The sqflite framework does not work with the flutter testing framework
///   and could not be tested yet. To test sqflite a local server setup would be
///   needed.
///
/// Widget Tests:
///   Widget rendering is dependend on state supplied by BLOC and on internationalization
///   tests: see down below
///
///
///
///
void main() {
  group("MoreScreenWidget-testing", () {
    Future<Null> _setUpMoreScreen(WidgetTester tester) async {
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<NavbarBloc>(
            create: (context) => NavbarBloc(),
          ),
          BlocProvider<TableCalenderBloc>(
            create: (context) => TableCalenderBloc(),
          ),
        ],
        child: MaterialApp(
          supportedLocales: [
            Locale('en', 'US'),
            Locale('de', 'DE'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          home: MoreScreen(),
        ),
      ));
    }

    Future<Null> _screenRendersOptionAbout(WidgetTester tester) async {
      // final childWidget2 = Container();
      final optionFinder = find.byType(MoreOptionBox);
      expect(optionFinder, findsNWidgets(4));
    }

    testWidgets("MoreScreen renders option about", (WidgetTester tester) async {
      await _setUpMoreScreen(tester);
      await _screenRendersOptionAbout(tester);
    });
  });

  group("HomeScreenWidget", () {
    Future<Null> _setUpMoreScreen(WidgetTester tester) async {
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<NavbarBloc>(
            create: (context) => NavbarBloc(),
          ),
          BlocProvider<TableCalenderBloc>(
            create: (context) => TableCalenderBloc(),
          ),
        ],
        child: MaterialApp(
          supportedLocales: [
            Locale('en', 'US'),
            Locale('de', 'DE'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          home: HomePageScreen(),
        ),
      ));
    }

    Future<Null> _screenRendersProgressIndicatorWhileLoading(
        WidgetTester tester) async {
      final optionFinder = find.byType(CircularProgressIndicator);
      expect(optionFinder, findsOneWidget);
    }

    testWidgets("HomePageScreen renders progress indicator while loading",
        (WidgetTester tester) async {
      await _setUpMoreScreen(tester);
      await _screenRendersProgressIndicatorWhileLoading(tester);
    });
  });

  group('StatisticsAnalyzer', () {
    test(
        'Statistics functions return null when supplied Arrays are not same length',
        () {
      var testArrayA = randomArray(5);
      var testArrayB = randomArray(7);

      final StatisticsAnalyzer analyzer = StatisticsAnalyzer();

      var resultCov = analyzer.calculateCovariance(testArrayA, testArrayB);
      var resultPearson = analyzer.pearsonCorrelation(testArrayA, testArrayB);
      var resultSpearman = analyzer.spearmanCorrelation(testArrayA, testArrayB);

      expect(resultCov, null);
      expect(resultPearson, null);
      expect(resultSpearman, null);
    });

    test(
        'Statistics functions return values when supplied Arrays are same length',
        () {
      var testArrayA = randomArray(5);
      var testArrayB = randomArray(5);

      final StatisticsAnalyzer analyzer = StatisticsAnalyzer();

      var resultCov = analyzer.calculateCovariance(testArrayA, testArrayB);
      var resultPearson = analyzer.pearsonCorrelation(testArrayA, testArrayB);
      var resultSpearman = analyzer.spearmanCorrelation(testArrayA, testArrayB);

      expect(resultCov.runtimeType, double);
      expect(resultPearson.runtimeType, double);
      expect(resultSpearman.runtimeType, double);
    });
  });
}
