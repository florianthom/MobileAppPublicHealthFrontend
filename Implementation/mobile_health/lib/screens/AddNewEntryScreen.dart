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

class AddNewEntryScreen extends StatefulWidget {
  final String categoryFromRoute;
  final String subCategoryFromRoute;

  const AddNewEntryScreen(this.categoryFromRoute, this.subCategoryFromRoute);

  @override
  _AddNewEntryScreenState createState() => _AddNewEntryScreenState(categoryFromRoute, subCategoryFromRoute);
}

class _AddNewEntryScreenState extends State<AddNewEntryScreen> {

  final String categoryFromRoute;
  final String subCategoryFromRoute;

  _AddNewEntryScreenState(this.categoryFromRoute, this.subCategoryFromRoute);

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
                      this.categoryFromRoute + " " + this.subCategoryFromRoute,


                      // diary = getDiaryById(1)
                      // create diaryEntry
                      // add event to diaryEntry
                      // diary.diaryEntries -> zu dieser Liste hinzufügen .AddDiaryEntryToList()

                      // databaseprovider.db.insert(diary.diaryEntries)

                        // insert(entryObject.runtimeType.toString(), entryObject)
                      // insert (diaryEntry.runtimeType.toString(), diaryEntry)







                    ),
                  )
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