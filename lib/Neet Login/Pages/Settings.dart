import 'package:flutter/material.dart';

class Settings1 extends StatefulWidget {
  const Settings1({Key? key}) : super(key: key);

  @override
  State<Settings1> createState() => _Settings1State();
}

class _Settings1State extends State<Settings1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Settings'),),
    );
  }
}
