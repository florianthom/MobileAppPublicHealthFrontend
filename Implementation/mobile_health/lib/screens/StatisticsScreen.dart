import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Add this line
import 'package:mobile_health/components/CostumBottomFloatingButton.dart';
import 'package:mobile_health/components/CustomBottomNavigationBar.dart';
import 'package:mobile_health/components/StaticTopAppBar.dart';
import 'package:mobile_health/components/TitleCardHome.dart';
import 'package:mobile_health/components/TitleCardStatistics.dart';
import 'package:mobile_health/components/TopAppBar.dart';
import 'package:mobile_health/database/database_provider.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black45,
      extendBodyBehindAppBar: false,

      appBar: StaticTopAppBar(title: AppLocalizations.of(context).staticsScreen_title), //

      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TitleCardStatistics(),
            Container(
              height: 200,
              color: Colors.green, //just an example
              child: NumericComboLinePointChart(NumericComboLinePointChart._createSampleData()),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: CostumBottomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

///Tests with Test Data
class NumericComboLinePointChart extends StatelessWidget {
  final List<charts.Series> seriesList;

  NumericComboLinePointChart(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return new charts.NumericComboChart(seriesList,
      animate: false,
      defaultRenderer: new charts.LineRendererConfig(),
    );
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {

    //blue line data
    final desktopSalesData = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    //red line data
    final tableSalesData = [
      new LinearSales(0, 10),
      new LinearSales(1, 50),
      new LinearSales(2, 200),
      new LinearSales(3, 150),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: tableSalesData,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

/*///create the chart
class NumericComboLinePointChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  NumericComboLinePointChart(this.seriesList, {this.animate});

  var db = database_provider.db;
  //print(db);

  /// Creates a [LineChart] with sample data and no transition.
  factory NumericComboLinePointChart.withData() {
    return new NumericComboLinePointChart(
      //no creation needed, import of real data
      _createData(),
      // Disable animations for image tests.
      animate: false,
    );
  }
}*/

/*/// data type QuantityTime
class QuantityTime {
  final int date;   //horizontal x Achse for dates
  final int quantity;  //diagonal y Achse

  QuantityTime(this.date, this.quantity);
}*/