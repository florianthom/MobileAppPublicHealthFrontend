import 'package:flutter/material.dart';
import 'package:mobile_health/components/AddNewCategoryOption.dart';
import 'package:mobile_health/components/CostumBottomFloatingButton.dart';
import 'package:mobile_health/components/CustomBottomNavigationBar.dart';
import 'package:mobile_health/components/StaticTopAppBar.dart';
import 'package:mobile_health/components/TitleCardAddNewEntryCategory.dart';
import 'package:mobile_health/components/TitleCardHome.dart';
import 'package:mobile_health/components/TitleCardStatistics.dart';
import 'package:mobile_health/components/TopAppBar.dart';
import 'package:mobile_health/database/database_provider.dart';
import 'package:mobile_health/models/DiaryEntry.dart';
import 'package:mobile_health/models/EntryType.dart';

class AddNewEntryCategoryScreen extends StatefulWidget {
  @override
  _AddNewEntryCategoryScreenState createState() => _AddNewEntryCategoryScreenState();
}

///*
class _AddNewEntryCategoryScreenState extends State<AddNewEntryCategoryScreen> {

  ///*
  Future<List<EntryType>> getDataAsync() async {
    return DatabaseProvider.db.getEntryTypes().then((value) => value.where((element) => element.parentTypeId == null).toList());
  }

  ///*
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataAsync(),
        builder: (context, snapshot) =>
        snapshot.hasData ? _buildWidget(snapshot.data) : const SizedBox());
  }

  ///*
  Widget _buildWidget(List<EntryType> data) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black45,
      extendBodyBehindAppBar: false,

      ///Adding of TopAppBar
      appBar: TopAppBar(),

      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            ///*
            TitleCardAddNewEntryCategory(),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: data.map((e) => AddNewCategoryOption(entryType: e)).take(3).toList(),
                // [
                //   AddNewCategoryOption(title: "hi"),
                // ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: CostumBottomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}