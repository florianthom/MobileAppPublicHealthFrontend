import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_health/components/CostumBottomFloatingButton.dart';
import 'package:mobile_health/components/CustomBottomNavigationBar.dart';
import 'package:mobile_health/components/MoreOptionBox.dart';
import 'package:mobile_health/components/StaticTopAppBar.dart';
import 'package:mobile_health/components/TitleCardHome.dart';
import 'package:mobile_health/components/TitleCardMore.dart';
import 'package:mobile_health/components/TitleCardShowDiaryEntry.dart';
import 'package:mobile_health/components/TitleCardStatistics.dart';
import 'package:mobile_health/components/TopAppBar.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_health/models/DiaryEntry.dart'; // Add this line

class ShowDiaryEntry extends StatefulWidget {

  final DiaryEntry diaryEntry;

  const ShowDiaryEntry({this.diaryEntry});

  @override
  _ShowDiaryEntryState createState() => _ShowDiaryEntryState(diaryEntry);
}

///*
class _ShowDiaryEntryState extends State<ShowDiaryEntry> {

  final DiaryEntry diaryEntry;

  _ShowDiaryEntryState(this.diaryEntry);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black45,
      extendBodyBehindAppBar: false,

      appBar: StaticTopAppBar(title: AppLocalizations.of(context).moreScreen_title),

      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TitleCardShowDiaryEntry(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                ///*
                children: [
                  Row(
                    children: [
                      Text("DiaryEntry-ID\n"),
                      Text(this.diaryEntry.id.toString()),
                    ],
            ),
                    Row(
                      children: [
                        Text("DiaryEntry-Date\n"),
                        Text(
                            new DateFormat('yyyy-MM-dd').format(DateTime.parse(this.diaryEntry.dateString))
                        ),
                      ],
                    ),
                  Row(
                    children: [
                      Text("DiaryEntry-Events\n"),
                      Column(
                        children: this.diaryEntry.entryEvents.map((e) => Container(
                          child: Row(
                            children: [
                              Text(e.entryType.name + "\t"),
                              Text(e.quantity.toString()),
                              Text(e.unit.name)
                            ],
                          ),
                        )).toList(),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("DiaryEntry-Comment\n"),
                      Text(this.diaryEntry.comment)
                    ],
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