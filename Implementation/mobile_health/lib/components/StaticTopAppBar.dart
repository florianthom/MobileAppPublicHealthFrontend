import 'package:flutter/material.dart';

///
/// Represents the TopAppBar with custom (propertie-based) Header
///
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

///
/// internal state-class for main class (StaticTopAppBar) (flutter specific)
///
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
