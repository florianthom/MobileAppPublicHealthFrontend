import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_health/bloc/navbar/navbar_bloc.dart';
import 'package:mobile_health/bloc/navbar/navbar_event.dart';
import 'package:mobile_health/bloc/navbar/navbar_state.dart';
import 'package:mobile_health/models/navbar/navbarRoute.dart';
import 'package:mobile_health/screens/CalenderScreen.dart';
import 'package:mobile_health/screens/HomePageScreen.dart';
import 'package:mobile_health/screens/MoreScreen.dart';
import 'package:mobile_health/screens/StatisticsScreen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

///*
class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 10.0,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: size.height / 10.0,
                color: Color.fromARGB(255, 101, 220, 213),
                child: Stack(
                  children: [
                    Container(
                        width: size.width,
                        height: size.height / 10.0,
                        child: BlocBuilder<NavbarBloc, NavbarState>(
                            builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(Icons.home,
                                    color: state.navItemSelected == 0
                                        ? Colors.white
                                        : Colors.grey.shade600),
                                onPressed: () {
                                  context.read<NavbarBloc>().add(
                                      SetNewNavBarRoute(
                                          NavbarRoute.Home.index));
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePageScreen()),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                                splashColor: Colors.white,
                              ),
                              IconButton(
                                icon: Icon(Icons.bar_chart,
                                    color: state.navItemSelected == 1
                                        ? Colors.white
                                        : Colors.grey.shade600),
                                onPressed: () {
                                  context.read<NavbarBloc>().add(
                                      SetNewNavBarRoute(
                                          NavbarRoute.Statistics.index));
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StatisticsScreen()),
                                        (Route<dynamic> route) => false,
                                  );
                                },
                                splashColor: Colors.white,
                              ),
                              Container(
                                width: size.width * 0.2,
                              ),
                              IconButton(
                                icon: Icon(Icons.calendar_today,
                                    color: state.navItemSelected == 3
                                        ? Colors.white
                                        : Colors.grey.shade600),
                                onPressed: () {
                                  context.read<NavbarBloc>().add(
                                      SetNewNavBarRoute(
                                          NavbarRoute.Calender.index));
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalenderScreen()),
                                        (Route<dynamic> route) => false,
                                  );
                                },
                                splashColor: Colors.white,
                              ),
                              IconButton(
                                icon: Icon(Icons.more_horiz,
                                    color: state.navItemSelected == 4
                                        ? Colors.white
                                        : Colors.grey.shade600),
                                onPressed: () {
                                  context.read<NavbarBloc>().add(
                                      SetNewNavBarRoute(
                                          NavbarRoute.Options.index));
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MoreScreen()),
                                        (Route<dynamic> route) => false,
                                  );
                                },
                                splashColor: Colors.white,
                              ),
                            ],
                          );
                        }))
                  ],
                ),
              )),
        ],
      ),
    );
  }

  ///*
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
