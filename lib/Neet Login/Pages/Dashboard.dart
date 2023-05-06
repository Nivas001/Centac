import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/Home/home_bottom.dart';
import 'package:login/Home/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:convert';


class Dash_neet extends StatefulWidget {
  const Dash_neet({Key? key}) : super(key: key);
  @override
  State<Dash_neet> createState() => _Dash_neetState();
}

class _Dash_neetState extends State<Dash_neet> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbtest();

    //print('$auth');
  }


  // final auth = FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //   if (user == null) {
  //     print('User is currently signed out!');
  //   } else {
  //     final String uid = user.uid;
  //     print('User id : $uid');
  //
  //     print('User is signed in!');
  //   }
  // });

  //final cloud = FirebaseFirestore.instance.collection("users").doc('Name');



  // void db() async{
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp();
  //
  //   final user = FirebaseAuth.instance.currentUser;
  //   if(user != null)
  //     {
  //       final uid = user.uid;
  //       print('User id : $uid');
  //
  //       final documentSnapshot =
  //       await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //       final name = documentSnapshot.get('Name');
  //       String? name1 ;
  //       name1 = name;
  //       final email = documentSnapshot.get('Mail');
  //       final age = documentSnapshot.get('Age');
  //       print('Name : $name');
  //
  //       print('Mail : $email');
  //       print('Age : $age');
  //     }
  //   else
  //     {
  //       print('No User Found');
  //     }
  // }


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
    print('Name :$name');
    print('Age : $age');
    print('Gender : $gender');
    print('Phone : $phone');
    print('Mail : $mail');
  }




  final FirebaseAuth auth1 = FirebaseAuth.instance;
  late User? user = auth1.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
        title: const Text(
          'DASHBOARD ',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
          ),
        ),
        elevation: 10.0,
      ),
      drawer: Drawer(
        child: Container(
          child: ListView(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Text(
                    'Centac',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.verified),
                title: const Text(
                  'Verification Status',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.feed_outlined),
                title: const Text(
                  'Merit List',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.stacked_bar_chart_sharp),
                title: const Text(
                  'Allotment Status',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
                onTap: () {
                  setState(() {});
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.feedback_outlined),
                title: const Text(
                  'Feedback',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text(
                  'App Home Page',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home_bottom()));
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
            future: dbtest(),
            builder: (context, snapshot){
              if(snapshot.connectionState != ConnectionState.done)
                return Text('Loading data!!');
              return Text('hi');
              //return Text('Name : $name');
            },
          ),
          //Text('$name'),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Allotment status',
            style: SF_bold(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            'Round 1',
            style: SF_bold(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: DataTable(
              dividerThickness: 2.0,
              dataTextStyle: const TextStyle(
                fontFamily: 'SF-Compact',
              ),
              columns: [
                DataColumn(
                  label: Text(
                    'College Name',
                    textAlign: TextAlign.center,
                    style: SF(),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Course allotted',
                    style: SF(),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Last date',
                    textAlign: TextAlign.center,
                    style: SF(),
                  ),
                ),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(
                      Text('PIMS'),
                    ),
                    DataCell(
                      Text('MBBS'),
                    ),
                    DataCell(
                      Text('24-04-2023'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // for making the text sf and making the weight bold
  TextStyle SF_bold() {
    return TextStyle(
      fontFamily: 'SF-Compact',
      fontWeight: FontWeight.bold,
    );
  }

  // for making text bold
  TextStyle SF() => TextStyle(fontFamily: 'SF-Compact');
}
