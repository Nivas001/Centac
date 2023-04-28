import 'package:flutter/material.dart';
import 'package:login/Home.dart';
import 'package:login/Neet%20Login/bottom.dart';

import 'login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
     // home: Home_page(),
      debugShowCheckedModeBanner: false,

      initialRoute: 'home',
      routes: {
        'home' :(context) => Home_page(),
        'login': (context) => Login(),
        'neet_page' : (context) => bottom(),

      },
    );
  }
}
