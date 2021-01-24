import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_health/bloc/navbar/navbar_bloc.dart';
import 'package:mobile_health/bloc/navbar/navbar_event.dart';
import 'package:mobile_health/bloc/navbar/navbar_state.dart';
import 'package:mobile_health/models/navbar/navbarRoute.dart';

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
                                    color: state.navItemSelected == 0 ? Colors.white : Colors.grey.shade600
                                ),
                                onPressed: () {
                                  context
                                      .read<NavbarBloc>()
                                      .add(SetNewNavBarRoute(NavbarRoute.Home.index));
                                  Navigator.pushReplacementNamed(context, "/home");
                                },
                                splashColor: Colors.white,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.bar_chart,
                                    color: state.navItemSelected == 1 ? Colors.white : Colors.grey.shade600

                                ),
                                onPressed: () {
                                  context
                                      .read<NavbarBloc>()
                                      .add(SetNewNavBarRoute(NavbarRoute.Statistics.index));
                                  Navigator.pushReplacementNamed(context, "/statistics");
                                },
                                splashColor: Colors.white,
                              ),
                              Container(
                                width: size.width * 0.2,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.calendar_today,
                                    color: state.navItemSelected == 3 ? Colors.white : Colors.grey.shade600
                                ),
                                onPressed: () {
                                  context
                                      .read<NavbarBloc>()
                                      .add(SetNewNavBarRoute(NavbarRoute.Calender.index));
                                  Navigator.pushReplacementNamed(context, "/calender");
                                },
                                splashColor: Colors.white,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.more_horiz,
                                    color: state.navItemSelected == 4 ? Colors.white : Colors.grey.shade600
                                ),
                                onPressed: () {
                                  context.read<NavbarBloc>()
                                      .add(SetNewNavBarRoute(NavbarRoute.Options.index));
                                  Navigator.pushReplacementNamed(context, "/more");
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
