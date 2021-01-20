import 'package:flutter/material.dart';
import 'package:mobile_health/components/CostumBottomFloatingButton.dart';
import 'package:mobile_health/components/CustomBottomNavigationBar.dart';
import 'package:mobile_health/components/StaticTopAppBar.dart';
import 'package:mobile_health/components/TitleCardHome.dart';
import 'package:mobile_health/components/TitleCardMore.dart';
import 'package:mobile_health/components/TitleCardStatistics.dart';
import 'package:mobile_health/components/TopAppBar.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Add this line

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black45,
      extendBodyBehindAppBar: false,


      appBar: StaticTopAppBar(title: AppLocalizations.of(context).moreScreen_title),


      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TitleCardMore(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: CostumBottomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}