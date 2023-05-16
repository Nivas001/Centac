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

  _launchGeneralInfo() async {
    const url = 'https://drive.google.com/file/d/1ob4vDiHmhNIZMjSMXKDiCk4g0TsBgt2O/view';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchUGNonNeet() async {
    const url = 'https://drive.google.com/file/d/1efg0BRutDBTV2vcXfywmSclURyX6pVIP/view';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchUGNeet() async {
    const url = 'https://drive.google.com/file/d/1mN3Ej1AXP1TRyPHkYVlE8mSBJpTfR1wU/view';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchUGProfessional() async {
    const url = 'https://drive.google.com/file/d/1efg0BRutDBTV2vcXfywmSclURyX6pVIP/view';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Color titletextcolor = Colors.black;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.black,fontFamily: 'Poppins',fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 15.0,
              ),
              Card(
                child: ClipPath(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.deepPurple,width: 5)
                      ),
                    ),
                    child: Expanded(
                      child: ListTile(
                        leading: Icon(Icons.help),
                        title: Text(
                          'Calculate Merit mark',
                          style: BoldPoppins(),
                        ),
                        subtitle: Text('Want to calculate your Merit mark? Click here',style: NormalPoppins(),),
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
                    ),
                  ),clipper: ClipperCircleBorder(),
                ),
              ),
              Card(
                child: ClipPath(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.deepPurple,width: 5)
                      ),
                    ),
                    child: Expanded(
                      child: ListTile(
                        leading : Icon(Icons.web),
                        title : Text(
                          'Centac Website',style: BoldPoppins(),
                        ),
                        subtitle: Text('Click here to enter Centac Website',style: NormalPoppins(),),
                        onTap: _launchURLBrowser,
                      ),
                    ),
                  ),clipper: ClipperCircleBorder(),
                ),
              ),
              Card(
                child: ClipPath(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.deepPurple,width: 5)
                      ),
                    ),
                    child: Expanded(
                      child: ListTile(
                        leading : Icon(Icons.info_outline_rounded),
                        title : Text(
                          'General Information',style: BoldPoppins(),
                        ),
                        subtitle: Text('General Information for Admission to UG Courses',style: NormalPoppins(),),
                        onTap: _launchGeneralInfo,
                      ),
                    ),
                  ),
                  clipper: ClipperCircleBorder(),
                ),
              ),
              Card(
                child: ClipPath(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.deepPurple,width: 5)
                      ),
                    ),
                    child: Expanded(
                      child: ListTile(
                        leading : Icon(Icons.school),
                        title : Text(
                          'UG Non-Neet',style: BoldPoppins(),
                        ),
                        subtitle: Text('UG Non neet Information Brochure',style: NormalPoppins(),),
                        onTap: _launchUGNonNeet,
                      ),
                    ),
                  ),
                  clipper: ClipperCircleBorder(),
                ),
              ),
              Card(
                child: ClipPath(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.deepPurple,width: 5)
                      ),
                    ),
                    child: Expanded(
                      child: ListTile(
                        leading : Icon(Icons.science_outlined),
                        title : Text(
                          'UG Neet',style: BoldPoppins(),
                        ),
                        subtitle: Text('UG Neet Information Brochure',style: NormalPoppins(),),
                        onTap: _launchUGNeet,
                      ),
                    ),
                  ),
                  clipper: ClipperCircleBorder(),
                ),
              ),

              Card(
                child: ClipPath(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.deepPurple,width: 5)
                      ),
                    ),
                    child: Expanded(
                      child: ListTile(
                        leading : Icon(Icons.engineering_outlined),
                        title : Text(
                          'UG Professional Courses',style: BoldPoppins(),
                        ),
                        subtitle: Text('UG Professional courses Information Brochure',style: NormalPoppins(),),
                        onTap: _launchUGProfessional,
                      ),
                    ),
                  ),
                  clipper: ClipperCircleBorder(),
                ),
              ),

              Card(
                child: ClipPath(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.deepPurple,width: 5)
                      ),
                    ),
                    child: Expanded(
                      child: ListTile(
                        leading: Icon(Icons.contacts_rounded),
                        title: Text(
                          'Contact',style: BoldPoppins(),
                        ),
                        subtitle: Text('Contact information for Centac',style: NormalPoppins(),),
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
                    ),
                  ),
                  clipper: ClipperCircleBorder(),
                ),
              ),
            ],
          ),
      ),
    );
  }

  TextStyle NormalPoppins() => TextStyle(fontFamily: 'Poppins');

  TextStyle BoldPoppins() => TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold, color: titletextcolor);

  ShapeBorderClipper ClipperCircleBorder() {
    return ShapeBorderClipper(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3)));
  }
}
