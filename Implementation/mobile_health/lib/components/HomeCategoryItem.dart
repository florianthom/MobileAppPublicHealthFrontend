import 'package:flutter/material.dart';
import 'package:mobile_health/models/EntryType.dart';

class HomeCategoryItem extends StatefulWidget {

  final EntryType entryType;
  HomeCategoryItem({
    EntryType entryType
  }): this.entryType = entryType;


  @override
  _HomeCategoryItemState createState() => _HomeCategoryItemState(entryType);
}

class _HomeCategoryItemState extends State<HomeCategoryItem> {

  _HomeCategoryItemState(this.entryType);
  final EntryType entryType;



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
                        entryType.name,
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