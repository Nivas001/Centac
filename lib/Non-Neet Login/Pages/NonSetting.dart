import 'package:flutter/material.dart';

class NonSettings1 extends StatefulWidget {
  const NonSettings1({Key? key}) : super(key: key);

  @override
  State<NonSettings1> createState() => _NonSettings1State();
}

class _NonSettings1State extends State<NonSettings1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Settings'),),
    );
  }
}
