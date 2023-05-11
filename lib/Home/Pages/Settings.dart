import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';


import 'package:login/Home/Pages/Functions/Merit%20Mark%20calculation/Merit_mark.dart';
import 'package:url_launcher/url_launcher_string.dart';

//final Uri url = Uri.parse('https://firebasestorage.googleapis.com/v0/b/centac-b36d6.appspot.com/o/Vol-1-General%20Infn.pdf?alt=media&token=6f3ddb20-d31e-4115-85ce-9e4adf61cf97');




class Home_settings extends StatefulWidget {
  const Home_settings({Key? key}) : super(key: key);

  @override
  State<Home_settings> createState() => _Home_settingsState();
}

class _Home_settingsState extends State<Home_settings> {

  _launchURLBrowser() async {
    const url = 'https://www.centacpuducherry.in/';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                leading : Icon(Icons.web),
                title : Text(
                  'Centac Website',style: TextStyle(fontFamily: 'Poppins'),
                ),
                onTap: _launchURLBrowser,
              ),
              ListTile(
                leading: Icon(Icons.contacts_rounded),
                title: Text(
                  'Contact',style: TextStyle(fontFamily: 'Poppins'),
                ),
                onTap: (){
                  AlertDialog alert = AlertDialog(
                    title: Text('Phone : 0413-2655571 \n\n'
                        'Email - PG NEET: centacpgneet@dhtepdy.edu.in\n'
                        'Email - UG NEET: centacugneet@dhtepdy.edu.in\n'
                        'Email - NON NEET: centacugnn@dhtepdy.edu.in '),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return alert;
                      });
                },
              ),
            ],
          ),
      ),
    );
  }
}
