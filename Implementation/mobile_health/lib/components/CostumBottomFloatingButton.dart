import 'package:flutter/material.dart';

class CostumBottomFloatingButton extends StatefulWidget {
  @override
  _CostumBottomFloatingButtonState createState() => _CostumBottomFloatingButtonState();
}

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
          onPressed: () {
            setState(() {
              // _selectedIndex = 2;
            });
          },
        ),
      ),
    );
  }
}
