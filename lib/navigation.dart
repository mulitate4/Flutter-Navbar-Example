// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

import 'pages/home.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(_selectedIndex,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          HomePage(),
          Container(color: Colors.red),
          Container(color: Colors.green),
        ],
      ),

      // Required for extending body!
      extendBody: true,

      // 1. Floating NavBar
      // floating_bottom_navigation_bar
      // bottomNavigationBar: FloatingNavbar(
      //   iconSize: 24,
      //   currentIndex: _selectedIndex,
      //   items: <FloatingNavbarItem>[
      //     FloatingNavbarItem(icon: Icons.home),
      //     FloatingNavbarItem(icon: Icons.delete),
      //     FloatingNavbarItem(icon: Icons.settings),
      //   ],
      //   onTap: changePage,
      //   backgroundColor: Colors.transparent,
      //   selectedBackgroundColor: Colors.black,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.black,
      // )

      // 2. Button NavBar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 0, 8),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFE3FFBE)),
                          foregroundColor:
                              MaterialStateProperty.all(Color(0xFF585858)),
                          elevation: MaterialStateProperty.all(5.0),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(16.0))),
                      child: Icon(
                        Icons.home,
                        size: 32.0,
                      ),
                      onPressed: () {
                        changePage(0);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 0, 8),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFE3FFBE)),
                          foregroundColor:
                              MaterialStateProperty.all(Color(0xFF585858)),
                          elevation: MaterialStateProperty.all(5.0),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(16.0))),
                      child: Icon(
                        Icons.delete,
                        size: 32.0,
                      ),
                      onPressed: () {
                        changePage(1);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 0, 8),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFE3FFBE)),
                          foregroundColor:
                              MaterialStateProperty.all(Color(0xFF585858)),
                          elevation: MaterialStateProperty.all(5.0),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(16.0))),
                      child: Icon(
                        Icons.settings,
                        size: 32.0,
                      ),
                      onPressed: () {
                        changePage(2);
                      }),
                )
              ],
            )),
      ),

      // 3. Basic NavBar
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.delete), label: "trash"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.settings), label: "settings"),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: changePage,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   selectedIconTheme: IconThemeData(color: Colors.white),
      // ),
    );
  }
}
