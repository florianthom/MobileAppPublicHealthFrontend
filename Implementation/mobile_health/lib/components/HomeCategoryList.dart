import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_health/components/HomeCategoryHeader.dart';
import 'package:mobile_health/components/HomeCategoryItem.dart';
import 'package:mobile_health/models/DiaryEntry.dart';
import 'package:mobile_health/models/EntryType.dart';

///
/// Represents a list (/ "table") of diary-entries at the home-screen
/// stores / represents a list of diary-entries
///
class HomeCategoryList extends StatefulWidget {
  final Key key;
  final List<DiaryEntry> diaryEntries;

  HomeCategoryList({List<DiaryEntry> diaryEntries, @required this.key})
      : this.diaryEntries = diaryEntries;

  @override
  _HomeCategoryListState createState() =>
      _HomeCategoryListState(diaryEntries, key);
}

///
/// internal state-class for main class (HomeCategoryList) (flutter specific)
///
class _HomeCategoryListState extends State<HomeCategoryList> {
  final Key key;
  final List<DiaryEntry> diaryEntries;

  _HomeCategoryListState(this.diaryEntries, this.key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: diaryEntries
            .asMap()
            .map((key, value) => MapEntry(
                key,
                Container(
                    child: HomeCategoryItem(
                        diaryEntryIndex: key + 1, diaryEntry: value))))
            .values
            .toList(),
      ),
    );
  }
}
