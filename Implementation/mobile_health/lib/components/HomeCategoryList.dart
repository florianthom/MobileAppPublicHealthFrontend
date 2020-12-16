import 'package:flutter/material.dart';
import 'package:mobile_health/components/HomeCategoryHeader.dart';
import 'package:mobile_health/components/HomeCategoryItem.dart';
import 'package:mobile_health/models/EntryType.dart';

class HomeCategoryList extends StatefulWidget {

  final List<EntryType> entryTypeList;
  HomeCategoryList({
    List<EntryType> entryTypeList
  }): this.entryTypeList = entryTypeList;


  @override
  _HomeCategoryListState createState() => _HomeCategoryListState(entryTypeList);
}

class _HomeCategoryListState extends State<HomeCategoryList> {

  _HomeCategoryListState(this.entryTypeList);
  final List<EntryType> entryTypeList;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: entryTypeList.map((a) => HomeCategoryItem(entryType: a)).take(3).toList(),
      ),
    );
  }
}
