import 'package:login/Neet Login/Pages/Dashboard.dart';
import 'package:login/Neet Login/Pages/Notification.dart';
import 'package:login/Neet Login/Pages/Settings.dart';
import 'package:login/Neet Login/Pages/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottom extends StatefulWidget {
  const bottom({Key? key}) : super(key: key);

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {

  var _selectedindex = 0;

  // void _navigatebottom(int index) {
  //   setState(() {
  //     _selectedindex = index;
  //   });
  // }

  final List<Widget> _pages = [
    Dash_neet(),
    Notifications(),
    User(),
    Settings(),
  ];

  List <Color> colours = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600]!,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        // this will change the body with the help of index number
        body: _pages[_selectedindex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(.20),
                offset: Offset(0,15),
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
            child: GNav(
              gap: 8,
              haptic: true,
              tabBackgroundColor: Colors.purple.withOpacity(0.1),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 14),
              duration: Duration(milliseconds: 500),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Notifications',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'User',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
              onTabChange: (index)
              {
                setState(() {
                  _selectedindex = index;
                });
              }
              ,
            ),
          ),
        ),
      ),
    );
  }
}
// body: Center(
//   child: RiveAnimation.network(
//     'https://public.rive.app/community/runtime-files/3772-7891-linkedin-animated-icons.riv',
//     fit: BoxFit.cover,
//   ),
// ),
