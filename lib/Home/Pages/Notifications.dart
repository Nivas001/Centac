import 'package:flutter/material.dart';

class Home_notification extends StatefulWidget {
  const Home_notification({Key? key}) : super(key: key);

  @override
  State<Home_notification> createState() => _Home_notificationState();
}

class _Home_notificationState extends State<Home_notification> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Notifications',
            style: TextStyle(fontFamily: 'Cinzel'),
          ),
        ),
      ),
    );
  }
}
