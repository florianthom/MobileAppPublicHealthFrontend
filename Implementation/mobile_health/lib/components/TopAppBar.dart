import 'package:flutter/material.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_bloc.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_event.dart';
import 'package:mobile_health/bloc/table_calender/table_calender_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_health/screens/CalenderScreen.dart';

class TopAppBar extends StatefulWidget implements PreferredSizeWidget {
  // kToolbarHeight = const in material.dart
  TopAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  _TopAppBarState createState() => _TopAppBarState();

  @override
  final Size preferredSize; // default is 56.0
}

///*
class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    return AppBar(
      title: BlocBuilder<TableCalenderBloc, TableCalenderState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                onPressed: () {
                  context
                      .read<TableCalenderBloc>()
                      .add(SetSelectedDayEvent(state.daySelected.subtract(Duration(days: 1))));
                },
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CalenderScreen()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: Text(state.daySelected.day.toString() +
                    "." +
                    state.daySelected.month.toString() +
                    "." +
                    state.daySelected.year.toString()),
              ),
              IconButton(
                  icon: Icon(Icons.keyboard_arrow_right_outlined),
                onPressed: () {
                  context
                      .read<TableCalenderBloc>()
                      .add(SetSelectedDayEvent(state.daySelected.add(Duration(days: 1))));
                },
              ),
            ],
          );
        },
      ),
      centerTitle: true,
      // elevation: ,
      backgroundColor: Color.fromARGB(255, 101, 220, 213),
    );
  }
}
