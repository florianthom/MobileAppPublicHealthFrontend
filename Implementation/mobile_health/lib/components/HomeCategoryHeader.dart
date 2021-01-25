import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCategoryHeader extends StatefulWidget {
  @override
  _HomeCategoryHeaderState createState() => _HomeCategoryHeaderState();
}

///*
class _HomeCategoryHeaderState extends State<HomeCategoryHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
      child: Container(
        child: Column(
          children: [
            Row(
            children: [
              Text(
                "Nr.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                  "Commentar Snippet",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              )
            ],
          ),
            Divider(
              color: Colors.black,
            )
          ]
        ),
      ),
    );
  }
}
