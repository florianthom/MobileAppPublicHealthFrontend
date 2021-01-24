import 'package:flutter/material.dart';
import 'package:mobile_health/components/HomeCategoryHeader.dart';
import 'package:mobile_health/components/HomeCategoryItem.dart';
import 'package:mobile_health/models/EntryType.dart';

class MoreOptionBox extends StatefulWidget {
  final String title;
  final String routeString;
  final Color iconColor;

  MoreOptionBox({String title, String routeString, Color iconColor})
      : this.title = title,
        this.routeString = routeString,
        this.iconColor = iconColor;

  @override
  _MoreOptionBoxState createState() => _MoreOptionBoxState(title, routeString, iconColor);
}

///*
class _MoreOptionBoxState extends State<MoreOptionBox> {
  _MoreOptionBoxState(this.title, this.routeString, this.iconColor);
  final String title;
  final String routeString;
  final Color iconColor;

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
                  IconButton(
                    icon: Icon(
                        Icons.info,
                        color: this.iconColor,
                      size: 35,
                    ),
                    onPressed: () {},
                    // splashColor: this.iconColor,
                  ),
                  SizedBox(
                    width: 10,
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
    );
  }
}
