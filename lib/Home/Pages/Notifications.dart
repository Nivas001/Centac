import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/Home/Pages/Functions/ShowingNotification.dart';


class Home_notification extends StatefulWidget {
  const Home_notification({Key? key}) : super(key: key);

  @override
  State<Home_notification> createState() => _Home_notificationState();
}

class _Home_notificationState extends State<Home_notification> {
  @override
  Widget build(BuildContext context)
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Notifications',
            style: TextStyle(
                fontFamily: 'Cinzel',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              color: Colors.purple,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber.shade300,
        ),
        body: ListView()
        // body: Center(
        //   child: Text(
        //     'Notifications',
        //     style: TextStyle(fontFamily: 'Cinzel'),
        //   ),
        // ),

          //body: ShowingNotification(),
      ),
    );
  }
}
