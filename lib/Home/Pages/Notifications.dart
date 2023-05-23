import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login/Home/Pages/Functions/Notification/Important.dart';
import 'package:login/Home/Pages/Functions/Notification/UGNonNeet.dart';
import 'package:login/Home/Pages/Functions/Notification/UgNeet.dart';
import 'dart:convert';
import 'package:login/Home/Pages/Functions/ShowingNotification.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:login/Home/Pages/Functions/Notification/Important.dart';


late String list1 = '';
late String list2 = '';
late String list3 = '';
late String list4 = '';
late String list5 = '';
late String list6 = '';

class Home_notification extends StatefulWidget {
  const Home_notification({Key? key}) : super(key: key);

  @override
  State<Home_notification> createState() => _Home_notificationState();
}

class _Home_notificationState extends State<Home_notification> {
  bool ShowUgNeet = false;
  bool All = true;
  bool ShowUgNonNeet = false;
  bool imp = false;

  void getData() async {
    Response response = await get(
      Uri.parse(
          'https://centac-b36d6-default-rtdb.asia-southeast1.firebasedatabase.app/.json'),
    );
    if(response.statusCode == 200)
    {
      String data = response.body;


      var info1 = jsonDecode(data)['Links'][1];
      var info2 = jsonDecode(data)['Links'][2];
      var info3 = jsonDecode(data)['Links'][3];
      var info4 = jsonDecode(data)['Links'][4];
      var info5 = jsonDecode(data)['Links'][5];
      var info6 = jsonDecode(data)['Links'][6];

      list1 = info1;
      list2 = info2;
      list3 = info3;
      list4 = info4;
      list5 = info5;
      list6 = info6;

      print(info1);
      print(data);
    }
    else
    {
      print(response.statusCode);
    }
  }

  _launchNotification() async {
    String url = list1;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch1 $url';
    }
  }

  _launchNeet() async {
    String url = list2;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchNeet1() async {
    String url = list3;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchNonNeet() async {
    String url = list4;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchNote() async {
    String url = list5;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchAdmission() async {
    String url = list6;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Query dbref1 = FirebaseDatabase.instance.ref().child('Notification');
  Query dbref2 = FirebaseDatabase.instance.ref().child('Neet');
  Query dbref3 = FirebaseDatabase.instance.ref().child('NeetFinal');
  Query dbref4 = FirebaseDatabase.instance.ref().child('NonNeet');
  Query dbref5 = FirebaseDatabase.instance.ref().child('Note');
  Query dbref6 = FirebaseDatabase.instance.ref().child('Admission');
  Query dblink = FirebaseDatabase.instance.ref().child('Links');

  @override
  Widget build(BuildContext context) {
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
          drawer: Drawer(
            child: Container(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Center(
                      child: Text('Centac Notifications',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ),
                  ListTile(
                    leading: const Icon(Icons.all_inclusive_rounded),
                    title: const Text(
                      'All Informations',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Home_notification())
                        );
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.notification_important_outlined),
                    title: const Text(
                      'Important News',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>Imp_notification())
                        );
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.health_and_safety_outlined),
                    title: const Text(
                      'UG Neet',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>Ugneet_notification())
                        );
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.science_outlined),
                    title: const Text(
                      'UG Non-Neet',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>UgNon_Neet_notification())
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 10.0,),

                FirebaseAnimatedList(
                  shrinkWrap: true,
                  query: dbref1,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                    return Card(
                      child: ClipPath(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(color: Colors.greenAccent,width: 5)
                            ),
                          ),
                          child: ListTile(
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(50),
                            //   side: BorderSide(width: 1, color: Colors.deepPurple.shade800),
                            // ),
                            // hoverColor: Colors.pinkAccent.shade400,
                            // dense: false,

                            title: Text(snapshot.child('1').value.toString(),style: TextStyle(fontFamily: 'SFPro'),),
                            onTap: _launchNotification,
                          ),
                        ),
                        clipper: ClipperCircleBorder(),
                      ),
                    );

                  },

                ),
                FirebaseAnimatedList(
                    shrinkWrap: true,
                    query: dbref2,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                      return Card(
                        child: ClipPath(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(color: Colors.greenAccent,width: 5)
                              ),
                            ),
                            child: ListTile(
                              title: Text(snapshot.child('1').value.toString(),style: TextStyle(fontFamily: 'SFPro'),),
                              onTap: _launchNeet,
                            ),
                          ),
                          clipper: ClipperCircleBorder(),
                        ),
                      );

                    }
                ),
                FirebaseAnimatedList(
                    shrinkWrap: true,
                    query: dbref3,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                      return Card(
                        child: ClipPath(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(color: Colors.greenAccent,width: 5)
                              ),
                            ),
                            child: ListTile(
                              title: Text(snapshot.child('1').value.toString(),style: TextStyle(fontFamily: 'SFPro'),),
                              onTap: _launchNeet1,
                            ),
                          ),
                          clipper: ClipperCircleBorder(),
                        ),
                      );

                    }
                ),
                FirebaseAnimatedList(
                    shrinkWrap: true,
                    query: dbref4,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                      return Card(
                        child: ClipPath(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(color: Colors.greenAccent,width: 5)
                                ),
                              ),
                              child: ListTile(
                                title: Text(snapshot.child('1').value.toString(),style: TextStyle(fontFamily: 'SFPro'),),
                                onTap: _launchNonNeet,
                              ),
                            ),
                            clipper: ClipperCircleBorder()
                        ),
                      );

                    }
                ),
                FirebaseAnimatedList(
                    shrinkWrap: true,
                    query: dbref5,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                      return Card(
                        child: ClipPath(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(color: Colors.greenAccent,width: 5)
                                ),
                              ),
                              child: ListTile(
                                title: Text(snapshot.child('1').value.toString(),style: TextStyle(fontFamily: 'SFPro'),),
                                onTap: _launchNote,
                              ),
                            ),
                            clipper: ClipperCircleBorder()
                        ),
                      );

                    }
                ),
                FirebaseAnimatedList(
                    shrinkWrap: true,
                    query: dbref6,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                      return Card(
                        child: ClipPath(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(color: Colors.red,width: 5)
                              ),
                            ),
                            child: ListTile(
                              title: Text(snapshot.child('1').value.toString(),style: TextStyle(fontFamily: 'Poppins'),),
                              onTap: _launchAdmission,
                            ),
                          ),
                          clipper: ClipperCircleBorder(),
                        ),
                      );

                    }
                ),

              ],
            ),
          )
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

  ShapeBorderClipper ClipperCircleBorder() {
    return ShapeBorderClipper(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3)));
  }
}
