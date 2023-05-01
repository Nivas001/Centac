import 'package:flutter/material.dart';
import 'package:login/Home/Pages/Home.dart';
import 'package:login/Home/home_bottom.dart';
import 'package:login/Neet%20Login/bottom.dart';

import 'Home/login.dart';
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

      initialRoute: 'bottom',
      routes: {
        'bottom' : (context) => Home_bottom(),
        'home' :(context) => Home_page(),
        'login': (context) => Login(),
        'neet_page' : (context) => bottom(),

      },
    );
  }
}
