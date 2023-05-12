
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:http/http.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher_string.dart';

late String list1 = '';
late String list2 = '';
late String list3 = '';
late String list4 = '';
late String list5 = '';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

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

      list1 = info1;
      list2 = info2;
      list3 = info3;
      list4 = info4;
      list5 = info5;

      print(info1);

    }
    else
    {
      print(response.statusCode);
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
  Query dblink = FirebaseDatabase.instance.ref().child('Links');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Notifications',style: TextStyle(color: Colors.black, fontFamily: 'Cinzel', fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 10.0,),

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



          ],
        ),
      )
    );
  }
  ShapeBorderClipper ClipperCircleBorder() {
    return ShapeBorderClipper(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3)));
  }
}
