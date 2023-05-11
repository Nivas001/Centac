import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:login/Home/Pages/Functions/Merit%20Mark%20calculation/Merit_mark.dart';

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
          appBar: AppBar(
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text(
                  'Calculate Merit mark',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Merit_mark(),
                      ),
                    );
                  });
                },
              ),
              ListTile(
                leading : Icon(Icons.info),
                title : Text(
                  'General Info',style: TextStyle(fontFamily: 'Poppins'),
                ),
                onTap: ()async{
                  const url = 'https://www.google.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              )
            ],
          )),
    );
  }
}
