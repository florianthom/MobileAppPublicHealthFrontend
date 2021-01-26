import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile_health/main.dart';

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
///   Widget rendering is dependend on state supplied by BLOC
///   and can not be fully tested because of that.
///
///
///
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('0'), findsOneWidget);
  });
}
