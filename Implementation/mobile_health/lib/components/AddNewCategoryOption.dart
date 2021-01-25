import 'package:flutter/material.dart';
import 'package:mobile_health/components/HomeCategoryHeader.dart';
import 'package:mobile_health/components/HomeCategoryItem.dart';
import 'package:mobile_health/models/EntryType.dart';

class AddNewCategoryOption extends StatefulWidget {

  final EntryType entryType;

  AddNewCategoryOption({EntryType entryType}) : this.entryType = entryType;

  @override
  _AddNewCategoryOptionState createState() => _AddNewCategoryOptionState(entryType);
}

///*
class _AddNewCategoryOptionState extends State<AddNewCategoryOption> {
  _AddNewCategoryOptionState(this.entryType);
  final EntryType entryType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: InkWell(
        onTap: (){
          var routerMap = Map<String, dynamic>();
          routerMap["diaryEntry"] = this.entryType;
          Navigator.pushNamed(context, "/diaryEntry", arguments: routerMap);
        },
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
                        this.entryType.name,
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
