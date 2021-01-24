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


                      // diary = getDiaryById(1)
                      // create diaryEntry
                      // add event to diaryEntry
                      // diary.diaryEntries -> zu dieser Liste hinzufügen .AddDiaryEntryToList()

                      // databaseprovider.db.insert(diary.diaryEntries)

                      // insert(entryObject.runtimeType.toString(), entryObject)
                      // insert (diaryEntry.runtimeType.toString(), diaryEntry)
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () async {

                      // var newDiaryEntry = new DiaryEntry(
                      //   comment: "test123",
                      //   dateString: "2021-01-24",
                      //   diaryId: 1
                      // );
                      //
                      // var storedDiaryEntry = await DatabaseProvider.db.insert(newDiaryEntry.runtimeType.toString(), newDiaryEntry);

                      print("0");

                      var storedUnits = await DatabaseProvider.db.getUnitById(1);

                      var entryEvent = new EntryEvent(
                        // diaryEntryId: storedDiaryEntry.id,
                        diaryEntryId: 1,
                      entryType: this.subEntryType,
                        quantity: 5000,
                        unit: storedUnits
                      );

                      var storedEntryEvent = await DatabaseProvider.db.insert(entryEvent.runtimeType.toString(), entryEvent);
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