import 'package:flutter/material.dart';
import 'package:mobile_health/components/HomeCategoryHeader.dart';
import 'package:mobile_health/components/HomeCategoryItem.dart';
import 'package:mobile_health/models/EntryType.dart';

class AddNewCategoryOption extends StatefulWidget {

  final String title;

  AddNewCategoryOption({String title}) : this.title = title;

  @override
  _AddNewCategoryOptionState createState() => _AddNewCategoryOptionState(title);
}

///*
class _AddNewCategoryOptionState extends State<AddNewCategoryOption> {
  _AddNewCategoryOptionState(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: InkWell(
        onTap: (){
          var routerMap = Map<String, dynamic>();
          routerMap["categoryFromRoute"] = "test-Data2 from category-selection";
          Navigator.pushNamed(context, "/addNewEventCategory/addNewEventSubCategory", arguments: routerMap);
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
                        this.title,
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
