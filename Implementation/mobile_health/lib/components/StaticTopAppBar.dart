import 'package:flutter/material.dart';

class StaticTopAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size preferredSize;

  final String title;

  StaticTopAppBar({Key key, String title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        this.title = title,
        super(key: key);

  _StaticTopAppBarState createState() => new _StaticTopAppBarState(title);
}

///*
class _StaticTopAppBarState extends State<StaticTopAppBar> {
  _StaticTopAppBarState(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(this.title),
        ],
      ),
      centerTitle: true,
      // elevation: ,
      backgroundColor: Color.fromARGB(255, 101, 220, 213),
    );
  }
}
