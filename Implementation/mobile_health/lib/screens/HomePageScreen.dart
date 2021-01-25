import 'package:flutter/material.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_bloc.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_state.dart';
import 'package:mobile_health/components/CostumBottomFloatingButton.dart';
import 'package:mobile_health/components/CustomBottomNavigationBar.dart';
import 'package:mobile_health/components/HomeCategoryHeader.dart';
import 'package:mobile_health/components/HomeCategoryList.dart';
import 'package:mobile_health/components/TestBottomFloatingButton.dart';
import 'package:mobile_health/components/TitleCardHome.dart';
import 'package:mobile_health/components/TopAppBar.dart';
import 'package:mobile_health/database/database_provider.dart';
import 'package:mobile_health/models/DiaryEntry.dart';
import 'package:mobile_health/models/EntryType.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}




class _HomePageScreenState extends State<HomePageScreen> {
  ///*
  Future<List<DiaryEntry>> getDataAsync() async {

    var returnValue = DatabaseProvider.db.getDiaryEntries();
    return returnValue;
  }

  ///*
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataAsync(),
        builder: (context, snapshot) =>
            snapshot.hasData ? _buildWidget(snapshot.data) : Container(color: Colors.white, child: Container(height: 100, width: 100, child: Center(child: CircularProgressIndicator())),));
  }

  ///*
  Widget _buildWidget(List<DiaryEntry> data) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,
      appBar: TopAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              TitleCardHome(),
              HomeCategoryHeader(),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  children: [
                  BlocBuilder<TableCalenderBloc, TableCalenderState>(
                    builder: (context, state) {
                      return HomeCategoryList( diaryEntries: data.where((element) => DateTime.parse(element.dateString) == (DateTime(state.daySelected.year, state.daySelected.month, state.daySelected.day))).toList());
                    },
                  ),
                    SizedBox(
                      height: 500,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton:
          CostumBottomFloatingButton(), //CostumBottomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
