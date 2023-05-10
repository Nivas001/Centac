import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../main.dart';
import 'package:firebase_auth/firebase_auth.dart';

//User? user = FirebaseAuth.instance.currentUser;

class User1 extends StatefulWidget {
  const User1({Key? key}) : super(key: key);

  @override
  State<User1> createState() => _User1State();
}

class _User1State extends State<User1> {
  final users = FirebaseAuth.instance.currentUser!.uid.toString();

  final userstream = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Bottom User : $userstream');
    dbtest();
  }

  String name = '';
  String address = '';
  String regno = '';
  String board = '';
  String mail = '';
  String nation = '';
  int age = 0;
  int pin = 0;
  int phone = 0;
  String gender = '';
  String religion = '';
  String image = '';
  String father_name = '';

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
        address = data['Address'];
        nation = data['Nationality'];
        board = data['Board'];
        mail = data['Mail'];
        age = data['Age'];
        gender = data['Gender'];
        pin = data['Pincode'];
        religion = data['Religion'];
        phone = data['Phone'];
        image = data['Image'];
        father_name = data['Fname'];
      });
    } else {
      setState(() {
        name = '';
        regno = '';
        address = '';
        nation = '';
        board = '';
        mail = '';
        age = 0;
        gender = '';
        pin = 0;
        religion = '';
        phone = 0;
        image = '';
        father_name = '';
      });
    }
  }

  final FirebaseAuth auth1 = FirebaseAuth.instance;
  late User? user = auth1.currentUser;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          children : [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 13.0,),
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage('$image'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Name'),
                subtitle: Text('$name'),
              ),
              ListTile(
                leading : Icon(Icons.numbers_outlined),
                title: Text('Application No.'),
                subtitle: Text('$regno'),
              ),
              ListTile(
                leading : Icon(Icons.access_time_rounded),
                title: Text('Age'),
                subtitle: Text('$age'),
              ),
              ListTile(
                leading : Icon(Icons.person_2_rounded),
                title: Text('Applicant Father\'s name'),
                subtitle: Text('$father_name'),
              ),
              ListTile(
                leading : Icon(Icons.phone),
                title: Text('Phone no.'),
                subtitle: Text('$phone'),
              ),
              ListTile(
                leading : Icon(Icons.email_outlined),
                title: Text('Email'),
                subtitle: Text('$mail'),
              ),

              ListTile(
                leading : Icon(Icons.favorite_rounded),
                title: Text('Nation'),
                subtitle: Text('$nation'),
              ),
              ListTile(
                leading : Icon(Icons.add_circle_sharp),
                title: Text('Religion'),
                subtitle: Text('$religion'),
              ),
              ListTile(
                leading : Icon(Icons.place),
                title: Text('Address'),
                subtitle: Text('$address'),
              ),
              ListTile(
                leading : Icon(Icons.pin_drop),
                title: Text('Pincode'),
                subtitle: Text('$pin'),
              ),
            ],
          ),
      ],
        ),
      ),
    );
  }
}
