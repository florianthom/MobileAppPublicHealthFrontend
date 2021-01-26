import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

///*
class _LoadingState extends State<Loading> {
  ///*
  @override
  void initState() {
    super.initState();
  }

  ///*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, "/home");
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          center: const Alignment(0.0, -0.0), // near the top right
          radius: 1.2,
          colors: [Color.fromARGB(255, 101, 220, 213), Colors.white],
          stops: [0.4, 1.0],
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Thyro\nHelpiii",
                  style: TextStyle(
                    fontSize: 64.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("assets/images/frontLogo.png")],
            )
          ]),
        ),
      ),
    ));
  }
}
