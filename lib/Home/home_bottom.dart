import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:login/Home/Pages/Home.dart';
import 'package:login/Home/Pages/Notifications.dart';
import 'package:login/Home/Pages/Settings.dart';

class Home_bottom extends StatefulWidget {
  const Home_bottom({Key? key}) : super(key: key);

  @override
  State<Home_bottom> createState() => _Home_bottomState();
}

class _Home_bottomState extends State<Home_bottom> {

  var _selectedindex = 0;

  final List<Widget> _action = [
    Home_page(),
    Home_notification(),
    Home_settings(),
  ];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _action[_selectedindex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: -12,
                blurRadius: 60,
                color: Colors.black.withOpacity(.20),
                offset: Offset(0,15),
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: GNav(
              gap: 8,
              haptic: true,
              tabBackgroundColor: Colors.purple.withOpacity(0.1),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              duration: Duration(milliseconds: 500),
              tabs: [
                GButton(icon: Icons.home,text: 'Home',),
                GButton(icon: Icons.notifications,text: 'Notifications',),
                GButton(icon: Icons.settings, text: 'Settings',),
              ],
              onTabChange: (index)
              {
                setState(() {
                  _selectedindex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
