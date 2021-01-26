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

///
/// Represents the screen to add a category to a possible new event-/diaryentry
///
class AddNewEntryCategoryScreen extends StatefulWidget {
  @override
  _AddNewEntryCategoryScreenState createState() =>
      _AddNewEntryCategoryScreenState();
}

///
/// Internal state-class for AddNewEntryCategoryScreen (flutter-specific)
///
class _AddNewEntryCategoryScreenState extends State<AddNewEntryCategoryScreen> {

  ///
  /// Function to get all data from the database with parentTypeId==null (aka "main"- Category and not a subCategory)
  ///
  Future<List<EntryType>> getDataAsync() async {
    return DatabaseProvider.db.getEntryTypes().then((value) =>
        value.where((element) => element.parentTypeId == null).toList());
  }

  ///
  /// Represents a way to resolve the Future introduced by database-call (getDataAsync()) via a so called FutureBuilder
  /// called _buildWidget to build actual widget-tree
  ///
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataAsync(),
        builder: (context, snapshot) =>
            snapshot.hasData ? _buildWidget(snapshot.data) : const SizedBox());
  }

  ///
  /// Functions builds actually widget-tree
  ///
  Widget _buildWidget(List<EntryType> data) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black45,
      extendBodyBehindAppBar: false,

      ///Adding of TopAppBar
      appBar: TopAppBar(),

      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              TitleCardAddNewEntryCategory(),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: data
                      .map<Widget>((e) => AddNewCategoryOption(entryType: e))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: CostumBottomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
