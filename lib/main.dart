import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/Home/Pages/Functions/Merit%20Mark%20calculation/Merit_mark.dart';
import 'package:login/Home/Pages/Home.dart';
import 'package:login/Home/home_bottom.dart';
import 'package:login/Neet%20Login/Pages/Dashboard.dart';
import 'package:login/Neet%20Login/bottom.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wiredash/wiredash.dart';
import 'Home/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
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

  checkifLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
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
    return Wiredash(
      projectId: 'centac-1l1wqrc',
      secret: 'tJ4R_0zLgLNpDt6crE3nuhEDcph08Szv',
      child: MaterialApp(
        theme: ThemeData.light(),
        //home: Home_page(),
        //home: isLogin? bottom() :Home_bottom() ,

        home: AnimatedSplashScreen(
          duration: 500,
          splash: Container(
            decoration: BoxDecoration(),
            child: Text(
              'Centac',
              style: TextStyle(
                  fontFamily: 'Fasthand',
                  fontSize: 40,
                  color: Colors.deepPurple.shade800,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.deepPurple.shade300,
          pageTransitionType: PageTransitionType.fade,
          splashTransition: SplashTransition.slideTransition,
          nextScreen: isLogin ? bottom() : Home_bottom(),
        ),

        debugShowCheckedModeBanner: false,

        //initialRoute: 'bottom',
        routes: {
          'bottom': (context) => Home_bottom(),
          'home': (context) => Home_page(),
          'login': (context) => Login(),
          'neet_page': (context) => bottom(),
          'merit_mark': (context) => Commerce(),
        },
      ),
    );
  }
}
