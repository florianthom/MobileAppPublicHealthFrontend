import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_health/components/HomeCategoryHeader.dart';
import 'package:mobile_health/components/HomeCategoryItem.dart';
import 'package:mobile_health/models/DiaryEntry.dart';
import 'package:mobile_health/models/EntryType.dart';

class HomeCategoryList extends StatefulWidget {

  final List<DiaryEntry> diaryEntries;
  HomeCategoryList({
    List<DiaryEntry> diaryEntries
  }): this.diaryEntries = diaryEntries;

  @override
  _HomeCategoryListState createState() => _HomeCategoryListState(diaryEntries);
}

///*
class _HomeCategoryListState extends State<HomeCategoryList> {

  final List<DiaryEntry> diaryEntries;

  _HomeCategoryListState(this.diaryEntries);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: diaryEntries
            .asMap()
            .map((key, value) => MapEntry(key, Container(child: HomeCategoryItem(diaryEntryIndex: key + 1, diaryEntry: value))))
            .values
            .toList(),
      ),
    );
  }
}
