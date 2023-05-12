import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/Home/Pages/Functions/Merit%20Mark%20calculation/Merit_mark.dart';
import 'package:login/Home/Pages/Home.dart';
import 'package:login/Home/home_bottom.dart';
import 'package:login/Neet%20Login/Pages/Dashboard.dart';
import 'package:login/Neet%20Login/bottom.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'Home/login.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('Token :$fcmToken');
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var isLogin = false;
  var auth = FirebaseAuth.instance;

  checkifLogin()async{
    auth.authStateChanges().listen((User? user) {
      if(user !=null && mounted){
        setState(() {
          isLogin = true;
        });
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkifLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
     //home: Home_page(),
      home: isLogin? bottom() :Home_bottom() ,
      debugShowCheckedModeBanner: false,

      //initialRoute: 'bottom',
      routes: {
        'bottom' : (context) => Home_bottom(),
        'home' :(context) => Home_page(),
        'login': (context) => Login(),
        'neet_page' : (context) => bottom(),
        'merit_mark' : (context) => Commerce(),

      },
    );
  }
}
