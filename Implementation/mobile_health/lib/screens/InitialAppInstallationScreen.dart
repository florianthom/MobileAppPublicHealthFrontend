import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Add this line

class InitialAppInstallationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Stack(children: [
        Transform.translate(
          offset: Offset(0,-75),
          child: Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage(
                  "assets/images/background.png",
                  scale: 1
                ),
                fit: BoxFit.cover,
                alignment: new Alignment(0, 0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
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
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/frontLogo.png",
                  scale: 1.5,
                )
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "hi",//AppLocalizations.of(context).initialAppInstallationScreen_adcopy,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 86, 86, 86),
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 86, 86, 86),
                        height: 2.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),
                  color: Color.fromARGB(255, 101, 220, 213),
                  padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ],
            )
          ]),
        ),
      ]),
    );
  }
}
