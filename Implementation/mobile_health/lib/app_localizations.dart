// // inspired by https://www.youtube.com/watch?v=lDfbbTvq4qM&ab_channel=ResoCoder
//
// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// ///
// /// Represents a different approach to introduce internationalization (e.g. translations)
// ///
// /// utilizes a .json config-file to store translations
// ///
// /// not used since decided to go the way like it is recommended by flutter with .arb files (see lib/I10n/*.arb)
// ///
// class AppLocalizations {
//   final Locale locale;
//
//   AppLocalizations(this.locale);
//
//   static AppLocalizations of(BuildContext context) {
//     return Localizations.of<AppLocalizations>(context, AppLocalizations);
//   }
//
//   static const LocalizationsDelegate<AppLocalizations> delegate =
//   _AppLocalizationsDelegate();
//
//   Map<String, String> _localizedStrings;
//
//   Future<bool> load() async {
//     // Load the language JSON file from the "lang" folder
//     String jsonString =
//     await rootBundle.loadString("assets/lang/${locale.languageCode}.json");
//     Map<String, dynamic> jsonMap = json.decode(jsonString);
//
//     _localizedStrings = jsonMap.map((key, value) {
//       return MapEntry(key, value.toString());
//     });
//
//     return true;
//   }
//
//   String translate(String key) {
//     return _localizedStrings[key];
//   }
// }
//
//
// class _AppLocalizationsDelegate
//     extends LocalizationsDelegate<AppLocalizations> {
//   const _AppLocalizationsDelegate();
//
//   @override
//   bool isSupported(Locale locale) {
//     return ["en", "de"].contains(locale.languageCode);
//   }
//
//   @override
//   Future<AppLocalizations> load(Locale locale) async {
//     AppLocalizations localizations = new AppLocalizations(locale);
//     await localizations.load();
//     return localizations;
//   }
//
//   @override
//   bool shouldReload(_AppLocalizationsDelegate old) => false;
// }