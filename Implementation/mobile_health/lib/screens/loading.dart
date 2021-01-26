import 'package:flutter/material.dart';

///
/// Represents the loading-screen
/// watchable with the restart of the app
/// configured to disappear on click of the cover ( and not if something is loaded or after x seconds)
///
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

///
/// Internal state-class for CalenderScreen (flutter-specific)
///
class _LoadingState extends State<Loading> {

  ///
  /// Tested initState-method
  /// currently not used
  ///
  @override
  void initState() {
    super.initState();
  }


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
                  "Thyro\nHelphiii",
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
