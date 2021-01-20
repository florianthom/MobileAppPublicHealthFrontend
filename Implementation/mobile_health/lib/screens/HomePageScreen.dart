import 'package:flutter/material.dart';
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

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  ///*
  Future<List<DiaryEntry>> getDataAsync() async {
    return []; //DatabaseProvider.db.getDiaryEntries();
  }

  ///*
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataAsync(),
        builder: (context, snapshot) =>
            snapshot.hasData ?_buildWidget(snapshot.data) : const SizedBox());
  }

  ///*
  Widget _buildWidget(List<DiaryEntry> data) {
    Size size = MediaQuery.of(context).size;
    print("here");
    print(data);
    return Scaffold(
      backgroundColor: Colors.black45,
      extendBodyBehindAppBar: false,
      appBar: TopAppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TitleCardHome(),
            HomeCategoryHeader(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  HomeCategoryList(
                    diaryEntries: data,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton:
          CostumBottomFloatingButton(), //CostumBottomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
