import 'package:flutter/material.dart';
import 'package:mobile_health/components/AddNewCategoryOption.dart';
import 'package:mobile_health/components/AddNewSubCategoryOption.dart';
import 'package:mobile_health/components/CostumBottomFloatingButton.dart';
import 'package:mobile_health/components/CustomBottomNavigationBar.dart';
import 'package:mobile_health/components/StaticTopAppBar.dart';
import 'package:mobile_health/components/TitleCardAddNewEntryCategory.dart';
import 'package:mobile_health/components/TitleCardAddNewEntrySubCategory.dart';
import 'package:mobile_health/components/TitleCardHome.dart';
import 'package:mobile_health/components/TitleCardStatistics.dart';
import 'package:mobile_health/components/TopAppBar.dart';
import 'package:mobile_health/database/database_provider.dart';
import 'package:mobile_health/models/EntryType.dart';

class AddNewEntrySubCategoryScreen extends StatefulWidget {
  final EntryType entryTypeFromRoute;

  const AddNewEntrySubCategoryScreen(this.entryTypeFromRoute);

  @override
  _AddNewEntrySubCategoryScreenState createState() => _AddNewEntrySubCategoryScreenState(entryTypeFromRoute);
}




///*
class _AddNewEntrySubCategoryScreenState extends State<AddNewEntrySubCategoryScreen> {

  final EntryType entryTypeFromRoute;

  _AddNewEntrySubCategoryScreenState(this.entryTypeFromRoute);

  ///*
  Future<List<EntryType>> getDataAsync() async {
    return DatabaseProvider.db.getEntryTypes().then((value) => value.where((element) => element.parentTypeId == entryTypeFromRoute.id).toList());
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

      appBar: TopAppBar(),

      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              TitleCardAddNewEntrySubCategory(),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: data.map((e) => AddNewSubCategoryOption(parentEntryType: this.entryTypeFromRoute, subEntryType: e)).take(3).toList(),
                ),
              ),
              SizedBox(height: 500,),
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