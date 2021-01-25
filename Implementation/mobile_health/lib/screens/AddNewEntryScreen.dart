import 'package:flutter/material.dart';
import 'package:mobile_health/components/AddNewCategoryOption.dart';
import 'package:mobile_health/components/CostumBottomFloatingButton.dart';
import 'package:mobile_health/components/CustomBottomNavigationBar.dart';
import 'package:mobile_health/components/StaticTopAppBar.dart';
import 'package:mobile_health/components/TitleCardAddNewEntryCategory.dart';
import 'package:mobile_health/components/TitleCardAddNewEntrySubCategory.dart';
import 'package:mobile_health/components/TitleCardHome.dart';
import 'package:mobile_health/components/TitleCardStatistics.dart';
import 'package:mobile_health/components/TopAppBar.dart';
import 'package:mobile_health/database/database_provider.dart';
import 'package:mobile_health/models/DiaryEntry.dart';
import 'package:mobile_health/models/EntryEvent.dart';
import 'package:mobile_health/models/EntryType.dart';
import 'package:intl/intl.dart';


class AddNewEntryScreen extends StatefulWidget {
  final EntryType parentEntryType;
  final EntryType subEntryType;

  const AddNewEntryScreen(this.parentEntryType, this.subEntryType);

  @override
  _AddNewEntryScreenState createState() => _AddNewEntryScreenState(parentEntryType, subEntryType);
}

///*
class _AddNewEntryScreenState extends State<AddNewEntryScreen> {

  final EntryType parentEntryType;
  final EntryType subEntryType;

  _AddNewEntryScreenState(this.parentEntryType, this.subEntryType);

  ///*
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black45,
      extendBodyBehindAppBar: false,

      appBar: TopAppBar(),

      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TitleCardAddNewEntrySubCategory(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      this.parentEntryType.name + " " + this.subEntryType.name,
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () async {
                      var dateToday = DateTime.now();
                      var formatter = new DateFormat('yyyy-MM-dd');
                      var dateTodayFormatted = formatter.format(dateToday);
                      print(dateTodayFormatted);
                      var newDiaryEntry = new DiaryEntry(
                        comment: "test123",
                        dateString: dateTodayFormatted,
                        diaryId: 1
                      );

                      var storedDiaryEntry = await DatabaseProvider.db.insertDiaryEntry(newDiaryEntry);

                      print("0");

                      var storedUnits = await DatabaseProvider.db.getUnitById(1);

                      var entryEvent = new EntryEvent(
                        diaryEntryId: storedDiaryEntry.id,
                          entryType: this.subEntryType,
                        quantity: 5000,
                        unit: storedUnits
                      );

                      var storedEntryEvent = await DatabaseProvider.db.insertEntryEvent(entryEvent);
                      print("1");
                      print(storedEntryEvent);

                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text("Buy now".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                ],
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