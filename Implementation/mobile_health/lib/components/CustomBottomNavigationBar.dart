import "package:flutter/material.dart";

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height/10.0,
      child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: size.width,
                    height: size.height/10.0,
                    color: Color.fromARGB(255, 101, 220, 213),
                    child: Stack(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height/10.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    color: _selectedIndex == 0 ? Colors.white : Colors.grey.shade600,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                     _selectedIndex = 0;
                                    });
                                  },
                                splashColor: Colors.white,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.bar_chart,
                                  color: _selectedIndex == 1 ? Colors.white : Colors.grey.shade600,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selectedIndex = 1;
                                  });
                                },
                                splashColor: Colors.white,
                              ),
                              Container(
                                width: size.width * 0.2,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: _selectedIndex == 3 ? Colors.white : Colors.grey.shade600,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selectedIndex = 3;
                                  });
                                },
                                splashColor: Colors.white,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.more_horiz,
                                  color: _selectedIndex == 4 ? Colors.white : Colors.grey.shade600,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selectedIndex = 4;
                                  });
                                },
                                splashColor: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ],
        ),
    );
  }

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }