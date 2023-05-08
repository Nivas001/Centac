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
        child: Center(
            child: Container(
              decoration: BoxDecoration(

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text('Name : $name'),
              Text('RegNo : $regno'),
              Text('Address : $address'),
              Text('Mail : $mail'),
              Text('Board : $board'),
              Text('Nation : $nation'),
              Text('Age : $age'),
              Text('Gender : $gender'),
              Text('Pincode : $pin'),
              Text('Religion : $religion'),
              Text('Phone : $phone'),
          ],
        ),
            )),
      ),
    );
  }
}
