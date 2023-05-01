import 'package:flutter/material.dart';

class Home_settings extends StatefulWidget {
  const Home_settings({Key? key}) : super(key: key);

  @override
  State<Home_settings> createState() => _Home_settingsState();
}

class _Home_settingsState extends State<Home_settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Settings',
            style: TextStyle(fontFamily: 'Cinzel'),
          ),
        ),
      ),
    );
  }
}
