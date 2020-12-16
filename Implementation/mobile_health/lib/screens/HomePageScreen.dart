import 'package:flutter/material.dart';
import 'package:mobile_health/components/CostumBottomFloatingButton.dart';
import 'package:mobile_health/components/CustomBottomNavigationBar.dart';
import 'package:mobile_health/components/TitleCardHome.dart';
import 'package:mobile_health/components/TopAppBar.dart';
import 'package:mobile_health/database/database_provider.dart';
import 'package:mobile_health/models/EntryType.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {


  Future<List<EntryType>> getDataAsync() async {
    return DatabaseProvider.db.getEntryTypes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataAsync(),
        builder: (context, snapshot) =>
            snapshot.hasData ? _buildWidget(snapshot.data) : const SizedBox()
    );
  }


  Widget _buildWidget(List<EntryType> data) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black45,
      extendBodyBehindAppBar: false,
      appBar: TopAppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TitleCardHome(),
            Column(
              children: data.map((a) => Text(a.name)).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: CostumBottomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
