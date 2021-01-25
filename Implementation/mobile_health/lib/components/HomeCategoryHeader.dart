import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Add this line

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
                AppLocalizations.of(context).homeHeaderNumber,
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
                AppLocalizations.of(context).homeHeaderSnipped,
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
