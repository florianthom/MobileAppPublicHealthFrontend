import 'package:flutter/material.dart';
import 'package:mobile_health/bloc/navbar/navbar_bloc.dart';
import 'package:mobile_health/bloc/navbar/navbar_event.dart';
import 'package:mobile_health/database/database_provider.dart';
import 'package:mobile_health/models/EntryType.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_health/models/navbar/navbarRoute.dart';
import 'package:mobile_health/screens/AddNewEntryCategoryScreen.dart';

class CostumBottomFloatingButton extends StatefulWidget {
  @override
  _CostumBottomFloatingButtonState createState() => _CostumBottomFloatingButtonState();
}

///*
class _CostumBottomFloatingButtonState extends State<CostumBottomFloatingButton> {

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return  Container(
      // color: Colors.grey,
      padding: EdgeInsets.only(top: 50),
      height: size.height / 4,
      width: size.width / 4,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: CircleBorder(
              side: BorderSide(
                color: Color.fromARGB(255, 101, 220, 213),
                width: 5,
              )),
          child: Icon(
            Icons.add,
            color: Color.fromARGB(255, 101, 220, 213),
          ),
          elevation: 0.0,
          onPressed: () async {

            context.read<NavbarBloc>()
            .add(SetNewNavBarRoute(NavbarRoute.AddItem.index));
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNewEntryCategoryScreen()),
                  (Route<dynamic> route) => false,
            );

            // EntryType tmpType = EntryType(
            //   description: "test1",
            //   name: "test1",
            // );
            // DatabaseProvider.db.insert(tmpType.runtimeType.toString(), tmpType);
            // setState(() { /*_selectedIndex = 2; */ });
          },
        ),
      ),
    );
  }
}
