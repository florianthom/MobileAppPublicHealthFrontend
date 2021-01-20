import 'package:flutter/material.dart';
import 'package:mobile_health/models/DiaryEntry.dart';
import 'package:mobile_health/models/EntryType.dart';

class HomeCategoryItem extends StatefulWidget {

  final DiaryEntry diaryEntry;
  HomeCategoryItem({
    DiaryEntry diaryEntry
  }): this.diaryEntry = diaryEntry;


  @override
  _HomeCategoryItemState createState() => _HomeCategoryItemState(diaryEntry);
}

///*
class _HomeCategoryItemState extends State<HomeCategoryItem> {

  _HomeCategoryItemState(this.diaryEntry);
  final DiaryEntry diaryEntry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(

        child: Column(

          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade600),
                color: Colors.grey.shade50,
              ),
              height: 60,
              child: Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Text(
                      // x diaryEntry == 1 Tag
                      "hi", //diaryEntry.comment,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}