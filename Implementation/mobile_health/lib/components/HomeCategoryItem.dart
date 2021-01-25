import 'package:flutter/material.dart';
import 'package:mobile_health/models/DiaryEntry.dart';
import 'package:mobile_health/models/EntryType.dart';

class HomeCategoryItem extends StatefulWidget {

  final DiaryEntry diaryEntry;
  final int diaryEntryIndex;

  HomeCategoryItem({
    DiaryEntry diaryEntry,
    int diaryEntryIndex
  }): this.diaryEntry = diaryEntry, this.diaryEntryIndex=diaryEntryIndex;


  @override
  _HomeCategoryItemState createState() => _HomeCategoryItemState(diaryEntry,diaryEntryIndex);
}

///*
class _HomeCategoryItemState extends State<HomeCategoryItem> {

  final DiaryEntry diaryEntry;
  final int diaryEntryIndex;

  _HomeCategoryItemState(this.diaryEntry, this.diaryEntryIndex);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(

        child: Column(

          children: [
            InkWell(
              onTap: () {
                var routerMap = Map<String, dynamic>();
                routerMap["diaryEntry"] = this.diaryEntry;
                Navigator.pushNamed(context, "/diaryEntry", arguments: routerMap);
              },
              child: Container(
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
                    Text(
                      this.diaryEntryIndex.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Text(
                        // x diaryEntry == 1 Tag
                        this.diaryEntry.comment.substring(0, this.diaryEntry.comment.length < 10 ? this.diaryEntry.comment.length-1 : 10) + "...", //diaryEntry.comment,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 25,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}