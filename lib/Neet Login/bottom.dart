import 'package:login/Neet Login/Pages/Dashboard.dart';
import 'package:login/Neet Login/Pages/Notification.dart';
import 'package:login/Neet Login/Pages/Settings.dart';
import 'package:login/Neet Login/Pages/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class bottom extends StatefulWidget {
  const bottom({Key? key}) : super(key: key);

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {

  var _selectedindex = 0;

  // void _navigatebottom(int index) {
  //   setState(() {
  //     _selectedindex = index;
  //   });
  // }

  final List<Widget> _pages = [
    Dash_neet(),
    Notifications(),
    User1(),
    Settings1(),
  ];

  List <Color> colours = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600]!,
    Colors.teal,
  ];

  @override

  dbtest() async{
    final user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    final docRef = FirebaseFirestore.instance.collection('users').doc(uid);

    // Retreive the data for the user's document in uid
    final documentSnapshot = await docRef.get();

    //Access the feilds
    final name = documentSnapshot.get('Name');
    final age = documentSnapshot.get('Age');
    final gender = documentSnapshot.get('Gender');
    final phone = documentSnapshot.get('Phone');
    final mail = documentSnapshot.get('Mail');
    final address = documentSnapshot.get('Address');
    final religion = documentSnapshot.get('Religion');
    final board = documentSnapshot.get('Board');
    final region = documentSnapshot.get('Region');
    final pin = documentSnapshot.get('Pincode');
    // final f_name = documentSnapshot.get('Father name');
    print('Name :$name');
    //print('Father name : $f_name');
    print('Age : $age');
    print('Gender : $gender');
    print('Phone : $phone');
    print('Mail : $mail');
    print('Address : $address');
    print('Religion : $religion');
    print('Board : $board');
    print('Region : $region');
    print('Pincode : $pin');
  }




  final FirebaseAuth auth1 = FirebaseAuth.instance;
  late User? user = auth1.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbtest();
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        // this will change the body with the help of index number
        body: _pages[_selectedindex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(.20),
                offset: Offset(0,15),
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
            child: GNav(
              gap: 8,
              haptic: true,
              tabBackgroundColor: Colors.purple.withOpacity(0.1),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 14),
              duration: Duration(milliseconds: 500),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Notifications',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'User',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
              onTabChange: (index)
              {
                setState(() {
                  _selectedindex = index;
                });
              }
              ,
            ),
          ),
        ),
      ),
    );
  }
}
// body: Center(
//   child: RiveAnimation.network(
//     'https://public.rive.app/community/runtime-files/3772-7891-linkedin-animated-icons.riv',
//     fit: BoxFit.cover,
//   ),
// ),
