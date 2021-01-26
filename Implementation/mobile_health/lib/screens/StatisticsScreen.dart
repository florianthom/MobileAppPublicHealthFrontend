import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Add this line
import 'package:mobile_health/components/CostumBottomFloatingButton.dart';
import 'package:mobile_health/components/CustomBottomNavigationBar.dart';
import 'package:mobile_health/components/StaticTopAppBar.dart';
import 'package:mobile_health/components/TitleCardHome.dart';
import 'package:mobile_health/components/TitleCardStatistics.dart';
import 'package:mobile_health/components/TopAppBar.dart';
import 'package:mobile_health/database/database_provider.dart';
import 'package:mobile_health/models/Diary.dart';
import 'package:mobile_health/models/EntryEvent.dart';
import 'package:mobile_health/models/DiaryEntry.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:sortedmap/sortedmap.dart';
import 'dart:collection';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {

  // Future<Diary> getDataAsync() async {
  //   return DatabaseProvider.db.getDiaryById(1);
  // }

  bool _valueSport = false;
  bool _valueFood = false;
  bool _valueMood = false;
  bool _valueSleep = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NumericComboLinePointChart._createSampleData(_valueSport, _valueMood),
        builder: (context, snapshot) =>
        snapshot.hasData ? _buildWidget(snapshot.data) : Container(color: Colors.white, child: Container(height: 100, width: 100, child: Center(child: CircularProgressIndicator())),));
  }

  //print(data);

  Widget _buildWidget(List<charts.Series<LinearSales, dynamic>> sampleData) {
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
            ///Checkboxes for choose of statistic user wants to see
            CheckboxListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 120.0),
                  title: Text("Sports", style: TextStyle(letterSpacing: 1.8),),
                  secondary: const Icon(Icons.sports),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: _valueSport,
                  onChanged: (bool value) {
                    setState(() {
                      _valueSport = value;
                      //
                    });
                  },
                  activeColor: Colors.black87,
                  checkColor: Colors.cyanAccent,
            ),
            CheckboxListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 120.0),
                  title: Text("Food", style: TextStyle(letterSpacing: 1.8)),
                  secondary: const Icon(Icons.emoji_food_beverage),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: _valueFood,
                  onChanged: (bool value) {
                    setState(() {
                      _valueFood = value;
                    });

                  },
                  activeColor: Colors.black87,
                  checkColor: Colors.cyanAccent,
            ),
            CheckboxListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 120.0),
                  title: Text("Mood", style: TextStyle(letterSpacing: 1.8)),
                  secondary: const Icon(Icons.mood),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: _valueMood,
                  onChanged: (bool value) {
                    setState(() {
                      _valueMood = value;
                    });
                  },
                  activeColor: Colors.black87,
                  checkColor: Colors.cyanAccent,

            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 120.0),
              title: Text("Sleep", style: TextStyle(letterSpacing: 1.8)),
              secondary: const Icon(Icons.bedtime),
              controlAffinity: ListTileControlAffinity.platform,
              value: _valueSleep,
              onChanged: (bool value) {
                setState(() {
                  _valueSleep = value;
                });
              },
              activeColor: Colors.black87,
              checkColor: Colors.cyanAccent,

            ),
            Divider(
                color: Colors.black
            ),
            Container(
              height: 200,

              ///Chart added to visible statistics screen with data
              child: NumericComboLinePointChart(sampleData),
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
  NumericComboLinePointChart(this.seriesList);

  final List<charts.Series> seriesList;

  ///days in one week you x axis of statistic YYYY-MM-DD
  static List<DateTime> formatWeek() {

    List<DateTime> weekNew;

    //Ändern zu Form YYYY-MM-DD !!!

    DateTime today = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    //String dayToday ="${today.year.toString().padLeft(4,'0')}-${today.month.toString().padLeft(2,'0')}-${today.day.toString().padLeft(2,'0')}";
    weekNew = [today];

    for (int i = 0; i < 6; i++) {
      DateTime tomorrow = DateTime(today.year, today.month, today.day - 1);
      //String dayTomorrow ="${tomorrow.year.toString().padLeft(4,'0')}-${tomorrow.month.toString().padLeft(2,'0')}-${today.day.toString().padLeft(2,'0')}";
      weekNew.add(tomorrow);
      today = tomorrow;
    }

    //print(weekNew);
    return weekNew; //YYYY-MM-DD
  }

  ///days in one week you x axis of statistic DD
  static List<int> formatDay(List<DateTime> week) {

    List <int> daysAWeek = new List<int>();
    int day;
    String dayString;

    week.forEach((date) {
      dayString = "${date.day.toString().padLeft(2,'0')}";
      day = int.parse(dayString);
      daysAWeek.add(day);
    });

    return daysAWeek; //DD

  }

  ///find out values of sport intensity 0 - 120 min
  static Future<List<double>> intensityOfSport(List<DateTime> week) async {

    List<DiaryEntry> entries = await DatabaseProvider.db.getDiaryEntries();

    LinkedHashMap<DateTime, double> sportWeek = new LinkedHashMap<DateTime, double>();
    week.forEach((date) {
      entries.forEach((entry) {

        if (entry.dateString == date.toString()) {
          //Fehler beim Vergleich
          //I/flutter ( 7734): 2021-01-20
          //I/flutter ( 7734): 2021-01-20T00:00:00.000
          //date von week ändern

          List<EntryEvent> sportEvents = entry.entryEvents.where((oneEvent) => oneEvent.entryType.id == 1 && oneEvent.unit.name == 'min');

          //print(sportEvents);

          sportEvents.forEach((sportEvent) {
            sportWeek[date] += sportEvent.quantity;
          });
        }
      });
    });

    //List<EntryEvent> events = await DatabaseProvider.db.getEntryEvents();

    ///List of week events sorted from today til today in 7 days
    List<double> sportIntensity;
    sportWeek.forEach((k, v) => sportIntensity.add(v));

    print(13);
    //print(sportIntensity);
    return sportIntensity;
  }

  ///find out values of mood intensity -> 1-10 mood scale
  static Future<List<double>> intensityOfMood(List<DateTime> week) async {

    List<DiaryEntry> entries = await DatabaseProvider.db.getDiaryEntries();

    LinkedHashMap<DateTime, double> moodWeek = new LinkedHashMap<DateTime, double>();
    week.forEach((date) {
      entries.forEach((entry) {

        if (entry.dateString == date.toString()) {
          //Fehler beim Vergleich
          //I/flutter ( 7734): 2021-01-20
          //I/flutter ( 7734): 2021-01-20T00:00:00.000
          //date von week ändern

          List<EntryEvent> moodEvents = entry.entryEvents.where((oneEvent) => oneEvent.entryType.id == 4 && oneEvent.unit.name == 'mood');

          moodEvents.forEach((moodEvent) {
            moodWeek[date] = moodEvent.quantity;
          });
        }
      });
    });

    //List<EntryEvent> events = await DatabaseProvider.db.getEntryEvents();

    ///List of week events sorted from today til today in 7 days
    List<double> moodIntensity;
    moodWeek.forEach((k, v) => moodIntensity.add(v));

    print(13);
    //print(moodIntensity);
    return moodIntensity;
  }

  @override
  Widget build(BuildContext context) {
    return new charts.NumericComboChart(seriesList,
      animate: false,
      defaultRenderer: new charts.LineRendererConfig(),
    );
  }

  ///creates a List of data and returns new charts.Series<LinearSales with specific color, axis and data
  static Future<List<charts.Series<LinearSales, num>>> _createSampleData(_valueSport, _valueMood) async {

    var week = formatWeek();
    var daysOfWeek = formatDay(week);
    var weeklySports = await intensityOfSport(week);
    var weeklyMood = await intensityOfMood(week);
    //var weeklySleep = intensityOfSleep(week);
    //var weeklyFood = intensityOfFood(week);

    print(1.5);
    print(weeklySports);
    ///Graph for weekly sports
    final sportsSalesData = [
      new LinearSales(daysOfWeek[6], weeklySports[6]),
      new LinearSales(daysOfWeek[5], weeklySports[5]),
      new LinearSales(daysOfWeek[4], weeklySports[4]),
      new LinearSales(daysOfWeek[3], weeklySports[3]),
      new LinearSales(daysOfWeek[2], weeklySports[2]),
      new LinearSales(daysOfWeek[1], weeklySports[1]),
      new LinearSales(daysOfWeek[0], weeklySports[0]),
    ];

    ///Data graph for sleep in hours
     final moodSalesData = [
       new LinearSales(daysOfWeek[6], weeklyMood[6]),
       new LinearSales(daysOfWeek[5], weeklyMood[5]),
       new LinearSales(daysOfWeek[4], weeklyMood[4]),
       new LinearSales(daysOfWeek[3], weeklyMood[3]),
       new LinearSales(daysOfWeek[2], weeklyMood[2]),
       new LinearSales(daysOfWeek[1], weeklyMood[1]),
       new LinearSales(daysOfWeek[0], weeklyMood[0]),
     ];

    print(3);

    /*///Data graph for sleep in hours
    final sleepSalesData = [
      new LinearSales(week[0], 5),
      new LinearSales(week[1], 25),
      new LinearSales(week[2], 10),
      new LinearSales(week[3], 75),
      new LinearSales(week[4], 5),
      new LinearSales(week[5], 80),
      new LinearSales(week[6], 75),
    ];

    final foodSalesData = [
      new LinearSales(week[0], 5),
      new LinearSales(week[1], 25),
      new LinearSales(week[2], 10),
      new LinearSales(week[3], 75),
      new LinearSales(week[4], 5),
      new LinearSales(week[5], 80),
      new LinearSales(week[6], 75),
    ];*/

    return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.day,
        measureFn: (LinearSales sales, _) => sales.intensity,
        data: sportsSalesData,

          /*if(_valueSport == true) {
              data: sportsSalesData,
          } else if() {

          } else {*/
      ),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.day,
        measureFn: (LinearSales sales, _) => sales.intensity,
        data: moodSalesData,
      )
    ];
  }
}

/// Sample linear data type - axis
class LinearSales {
  final num day; //day
  final double intensity; //intensity of event

  LinearSales(this.day, this.intensity);
}

//alle diary by id = 1 holen & nach datum filtern   getDiaryById(1)
//checkboxen - je ENTRYTYPE, neuer Type adde new checkbox

