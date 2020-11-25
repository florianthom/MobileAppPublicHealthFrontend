import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void waitSeconds() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  void initState() {
    super.initState();
    waitSeconds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
    );
  }
}