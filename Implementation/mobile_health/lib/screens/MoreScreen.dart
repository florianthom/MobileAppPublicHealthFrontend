import 'package:flutter/material.dart';
import 'package:mobile_health/components/CostumBottomFloatingButton.dart';
import 'package:mobile_health/components/CustomBottomNavigationBar.dart';
import 'package:mobile_health/components/MoreOptionBox.dart';
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

///*
class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black45,
      extendBodyBehindAppBar: false,
      appBar:
          StaticTopAppBar(title: AppLocalizations.of(context).moreScreen_title),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TitleCardMore(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                ///*
                children: [
                  MoreOptionBox(
                      title: AppLocalizations.of(context).addEventCategory,
                      routeString: "test/route",
                      iconColor: Color.fromARGB(255, 101, 220, 213)),
                  MoreOptionBox(
                    title: AppLocalizations.of(context).addMarker,
                    routeString: "test/route",
                    iconColor: Colors.orange,
                  ),
                  MoreOptionBox(
                    title: AppLocalizations.of(context).about,
                    routeString: "test/route",
                    iconColor: Colors.green,
                  ),
                  MoreOptionBox(
                    title: AppLocalizations.of(context).legalInformation,
                    routeString: "test/route",
                    iconColor: Colors.red,
                  ),
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
