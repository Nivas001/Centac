import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login/Home/Pages/Functions/Notification/Important.dart';
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

class UgNon_Neet_notification extends StatefulWidget {
  const UgNon_Neet_notification({Key? key}) : super(key: key);

  @override
  State<UgNon_Neet_notification> createState() => _UgNon_Neet_notificationState();
}

class _UgNon_Neet_notificationState extends State<UgNon_Neet_notification> {
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
      home: WillPopScope(
        onWillPop: ()async{
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_sharp),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'UG Non-Neet',
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

            body: Container(
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 10.0,),

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
      ),
    );
  }

  ShapeBorderClipper ClipperCircleBorder() {
    return ShapeBorderClipper(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3)));
  }
}
