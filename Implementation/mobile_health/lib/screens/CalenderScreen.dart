import 'package:flutter/material.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_bloc.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_event.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_state.dart';
import 'package:mobile_health/components/CostumBottomFloatingButton.dart';
import 'package:mobile_health/components/CustomBottomNavigationBar.dart';
import 'package:mobile_health/components/StaticTopAppBar.dart';
import 'package:mobile_health/components/TitleCardHome.dart';
import 'package:mobile_health/components/TitleCardMore.dart';
import 'package:mobile_health/components/TitleCardStatistics.dart';
import 'package:mobile_health/components/TopAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_health/database/database_provider.dart';
import 'package:mobile_health/models/DiaryEntry.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalenderScreen extends StatefulWidget {
  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

///*
class _CalenderScreenState extends State<CalenderScreen> {
  CalendarController _calendarController;

  ///*
  @override
  void initState() {
    super.initState();
    this._calendarController = CalendarController();
    print("here: " + DateTime.now().toString());
    // this._calendarController.setSelectedDay(new DateTime(2021, 1, 20), runCallback: true);
    print(this._calendarController.selectedDay);
    // this._calendarController.setSelectedDay(DateTime.now());
  }

  ///*
  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  ///*
  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  Future<List<DiaryEntry>> getDataAsync() async {
    var returnValue = DatabaseProvider.db.getDiaryEntries();
    return returnValue;
  }

  ///*
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataAsync(),
        builder: (context, snapshot) => snapshot.hasData
            ? _buildWidget(snapshot.data)
            : Container(
                color: Colors.white,
                child: Container(
                    height: 100,
                    width: 100,
                    child: Center(child: CircularProgressIndicator())),
              ));
  }

  ///*
  Widget _buildWidget(List<DiaryEntry> data) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,

      appBar: StaticTopAppBar(title: AppLocalizations.of(context).calender),

      body: Container(
        // color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildTableCalendar(data), const SizedBox(height: 8.0)],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: CostumBottomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  ///*
  Widget _buildTableCalendar(List<DiaryEntry> data) {
    data = data;
    return BlocBuilder<TableCalenderBloc, TableCalenderState>(
      builder: (context, state) {
        return TableCalendar(
          calendarController: _calendarController,
          events: Map.fromEntries(
              data.map((e) => MapEntry(e.toDataTimeConvert(), e.entryEvents))),
          holidays: {},
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: CalendarStyle(
            selectedColor: Colors.deepOrange[400],
            todayColor: Colors.deepOrange[200],
            markersColor: Colors.brown[700],
            outsideDaysVisible: false,
          ),
          headerStyle: HeaderStyle(
            formatButtonTextStyle:
                TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
            formatButtonDecoration: BoxDecoration(
              color: Colors.deepOrange[400],
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          onDaySelected: (DateTime day, List events, List holidays) {
            context.read<TableCalenderBloc>().add(SetSelectedDayEvent(day));
          },
          onVisibleDaysChanged: _onVisibleDaysChanged,
          onCalendarCreated:
              (DateTime first, DateTime last, CalendarFormat format) {
            this._calendarController.setSelectedDay(state.daySelected);
          },
        );
      },
    );
  }
}
