import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/Home/home_bottom.dart';
import 'package:login/Home/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:convert';
import 'package:wiredash/wiredash.dart';

import 'package:login/Neet%20Login/Pages/Extras/Verification.dart';
import 'package:login/Non-Neet%20Login/Login/LoginNon.dart';


_launchURLBrowser() async {
  const url = 'https://www.centacpuducherry.in/';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Dash_nonneet extends StatefulWidget {
  const Dash_nonneet({Key? key}) : super(key: key);
  @override
  State<Dash_nonneet> createState() => _Dash_nonneetState();
}

class _Dash_nonneetState extends State<Dash_nonneet> {
  final users = FirebaseAuth.instance.currentUser!.uid.toString();

  final userstream = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Bottom User : $userstream');
    dbtest();
    dbStatus();
    dbAllot();

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

  String name = '';
  String address = '';
  String regno = '';
  String image = '';

  String clg1 = '';
  String lastdate = '';
  String course = '';
  String status = '';
  int round = 0;
  int widthfail = 120;

  String academy = '';
  String residence = '';
  String caste = '';
  String category = '';
  var verifistatus = '';
  String rur_urb = '';
  Color valid = Colors.green;

  String NoClg = '';
  String NoVerificatio = '';
  bool visibility1 = true;
  bool visibility2 = false;
  bool visibility3 = false;
  bool visibility4 = false;

  dbtest() async {
    final user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    final docRef = FirebaseFirestore.instance.collection('users').doc(uid);

    // Retreive the data for the user's document in uid
    final documentSnapshot = await docRef.get();

    //App data's are pushed here
    if (documentSnapshot.exists) {
      final data = documentSnapshot.data();
      setState(() {
        name = data!['Name'] ?? '';
        regno = data['RegNo'];
        image = data['Image'];
      });
    } else {
      setState(() {
        name = '';
      });
    }
  }

  dbStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    final docRef = FirebaseFirestore.instance.collection('Status').doc(uid);

    // Retreive the data for the user's document in uid
    final documentSnapshot = await docRef.get();

    //App data's are pushed here
    if (documentSnapshot.exists) {
      final data = documentSnapshot.data();
      setState(() {
        academy = data!['Academy'] ?? '';
        residence = data['Residence'];
        caste = data['Caste'];
        category = data['Category'];
        rur_urb = data['Rural'];

        print(' Academy : $academy');
        print('Residence : $residence');
        print('Caste : $caste');
        print('Category : $category');

        if (academy == 'Success' &&
            residence == 'Success' &&
            caste == 'Success' &&
            category == 'Success' && rur_urb == 'Success') {
          verifistatus = 'All Documents are verified';
          valid = Colors.green;
          widthfail = 120;
        } else {
          verifistatus = 'Verification status need to be pending';
          valid = Colors.red;
          visibility1 = false;
          widthfail = 74;
          visibility4 = true;
          NoVerificatio = 'Please upload/change your Pending files which are incomplete in your Verification status';
        }
      });
    } else {
      academy = '';
      residence = '';
      caste = '';
      category = '';
    }
  }

  dbAllot() async {
    final user1 = FirebaseAuth.instance.currentUser;
    final uid = user1?.uid;
    final allot = FirebaseFirestore.instance.collection('Nonallotment').doc(uid);

    final documentSnapshot = await allot.get();

    if (documentSnapshot.exists) {
      final data = documentSnapshot.data();
      print(data);
      setState(() {
        round = data!['Round'] ?? '';
        print(round);


          clg1 = data['Clgname'];
          if (clg1 == '') {
            NoClg = 'No Course have been alloted for you in this round';
            visibility1 = false;
            visibility2 = true;
            visibility3 = true;
          }
          if(clg1 != '') {
            course = data['Course'];
            lastdate = data['Lastdate'];
            status = data['Status'];
            visibility3 = true;
          }
          print(clg1);
          print(lastdate);
          print(course);
          print(status);

          if(clg1.length <=10 ){

          }
      });
    }
  }
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginNon()),
      );
    });
  }


  final FirebaseAuth auth1 = FirebaseAuth.instance;
  late User? user = auth1.currentUser;

  @override
  Widget build(BuildContext context) {
    double phonewidth = MediaQuery.of(context).size.width;
    print(phonewidth);

    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
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
          elevation: 5.0,
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
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Verification()));
                    });
                  },
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
                    setState(() {
                      Navigator.pop(context);
                    });
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
                  onTap: _signOut,
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
                  onTap: () {
                    Wiredash.of(context).show(inheritMaterialTheme: true);
                  },
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
            // FutureBuilder(
            //   future: dbtest(),
            //   builder: (context, snapshot){
            //     if(snapshot.connectionState != ConnectionState.done)
            //       return Text('Loading data!!');
            //     return Text('hi');
            //     //return Text('Name : $name');
            //   },
            // ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              width: phonewidth - widthfail,
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              //color: Colors.grey,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      '$image',
                    ),
                    radius: 24,
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Text(
                        'Name : $name',
                        style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Reg. No : $regno',
                        style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$verifistatus',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: valid,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30.0,
            ),
            Text(
              'UG NON-NEET',
              style: SF_bold(),
            ),
            Text(
              'Allotment status',
              style: SF_bold(),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Round $round',
              style: SF_bold(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Visibility(
              visible: visibility2,
              child: Text(
                '$NoClg',
                style: TextStyle(fontFamily: 'SF Pro'),
              ),
            ),
            Visibility(
              visible : visibility4,
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.red, width: 5),
                      right: BorderSide(color: Colors.red, width: 5),
                    ),
                    // borderRadius: BorderRadius.circular(20),
                  ),
                  child: Visibility(
                      child: Text('$NoVerificatio',style: TextStyle(fontFamily: 'SF Pro',color: Colors.black),)
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Visibility(
                  visible: visibility1,
                  child: DataTable(
                    dividerThickness: 2.0,
                    columnSpacing: 13,
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
                      DataColumn(
                        label: Text(
                          'Status',
                          textAlign: TextAlign.center,
                          style: SF(),
                        ),
                      ),
                    ],
                    rows:  [
                      DataRow(
                        cells: [
                          DataCell(
                            Text('$clg1', style: ColorBlack(),),
                          ),
                          DataCell(
                            Text('$course', style: ColorBlack(),),
                          ),
                          DataCell(
                            Text('$lastdate', style: ColorBlack(),),
                          ),
                          DataCell(
                            Text('$status', style: ColorBlack(),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),

            Visibility(
              visible: visibility3,
              child: GestureDetector(
                onTap: _launchURLBrowser,
                child: Card(
                  shadowColor: Colors.black,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    //alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.deepPurple, width: 5),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'If you want to continue for the next round',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                        Text(
                          'Please click here to select for next round Preference',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
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

  TextStyle ColorBlack() => TextStyle(color: Colors.black);

  // for making text bold
  TextStyle SF() => TextStyle(fontFamily: 'SF-Compact');
}
