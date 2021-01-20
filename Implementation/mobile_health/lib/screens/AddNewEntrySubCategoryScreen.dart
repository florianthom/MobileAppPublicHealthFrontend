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

class AddNewEntrySubCategoryScreen extends StatefulWidget {
  final String categoryFromRoute;

  const AddNewEntrySubCategoryScreen(this.categoryFromRoute);

  @override
  _AddNewEntrySubCategoryScreenState createState() => _AddNewEntrySubCategoryScreenState(categoryFromRoute);
}

class _AddNewEntrySubCategoryScreenState extends State<AddNewEntrySubCategoryScreen> {

  final String categoryFromRoute;

  _AddNewEntrySubCategoryScreenState(this.categoryFromRoute);

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
                  AddNewCategoryOption(title: this.categoryFromRoute),


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