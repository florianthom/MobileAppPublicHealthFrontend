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


///
/// Respresents the screen to show the details of individual diary-entries
///
class ShowDiaryEntry extends StatefulWidget {
  final DiaryEntry diaryEntry;

  const ShowDiaryEntry({this.diaryEntry});

  @override
  _ShowDiaryEntryState createState() => _ShowDiaryEntryState(diaryEntry);
}

///
/// Internal state-class for CalenderScreen (flutter-specific)
///
class _ShowDiaryEntryState extends State<ShowDiaryEntry> {
  final DiaryEntry diaryEntry;

  _ShowDiaryEntryState(this.diaryEntry);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black45,
      extendBodyBehindAppBar: false,
      appBar:
          StaticTopAppBar(title: AppLocalizations.of(context).showEventDetails),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TitleCardShowDiaryEntry(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 101, 220, 213),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context).diaryEntryId,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 86, 86, 86),
                                    fontSize: 20),
                              ),
                            ),
                            Text(
                              this.diaryEntry.id.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 86, 86, 86),
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              AppLocalizations.of(context).diaryEntryDate,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 86, 86, 86),
                                  fontSize: 20),
                            )),
                            Text(
                              new DateFormat('yyyy-MM-dd').format(
                                  DateTime.parse(this.diaryEntry.dateString)),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 86, 86, 86),
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context).diaryEntryEvents,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 86, 86, 86),
                                    fontSize: 20),
                              ),
                            ),
                            Column(
                              children: this
                                  .diaryEntry
                                  .entryEvents
                                  .map((e) => Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              e.entryType.name + " ",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 86, 86, 86),
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              e.quantity.toString() + " ",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 86, 86, 86),
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              e.unit.name,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 86, 86, 86),
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              AppLocalizations.of(context).diaryEntryComment,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 86, 86, 86),
                                  fontSize: 20),
                            )),
                            Container(
                              width: 0.4 * size.width,
                              child: Text(
                                this.diaryEntry.comment,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 86, 86, 86),
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
