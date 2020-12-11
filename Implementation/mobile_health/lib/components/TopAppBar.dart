import 'package:flutter/material.dart';

class TopAppBar extends StatefulWidget implements PreferredSizeWidget{


  // kToolbarHeight = const in material.dart
  TopAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  _TopAppBarState createState() => _TopAppBarState();

  @override
  final Size preferredSize; // default is 56.0
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {

    DateTime today = DateTime.now();

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.keyboard_arrow_left),
          Text(today.day.toString() + "." + today.month.toString() + "." +
              today.year.toString()),
          Icon(Icons.keyboard_arrow_right_outlined),
        ],
      ),
      centerTitle: true,
      // elevation: ,
      backgroundColor: Color.fromARGB(255, 101, 220, 213),
    );
  }
}
