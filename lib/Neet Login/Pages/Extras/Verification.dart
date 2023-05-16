import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {

  String name = '';
  String reg = '';

  String academy = '';
  String residence = '';
  String caste = '';
  String category = '';

  Color academycolors = Colors.red;

  String verifistatus = '';
  Color academycolor = Colors.white;
  Color residencecolor = Colors.white;
  Color castecolor = Colors.green;
  Color categorycolor = Colors.green;
  Color main = Colors.green;

  String academycheck = '';
  String residencecheck = '';
  String castecheck = '';
  String categorycheck = '';

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
        print(' Academy : $academy');
        print('Residence : $residence');
        print('Caste : $caste');
        print('Category : $category');

        if (academy != 'Success') {
          academycheck = 'Academic certificates need to be verified';
          academycolor = Colors.red;
        } else {
          academycheck = 'Academic certificates are verified';
          academycolor = Colors.green;
        }
        var temp = academycolor.toString();
        print(temp);

        if (caste != 'Success') {
          castecheck = 'Caste certificates need to be verified';
          castecolor = Colors.red;
        } else {
          castecheck = 'Caste certificates are verified';
          castecolor = Colors.green;
        }
        if (category != 'Success') {
          categorycheck = 'Category certificates need to be verified';
          categorycolor = Colors.red;
        } else {
          categorycheck = 'Category certificates are verified';
          categorycolor = Colors.green;
        }
        if (residence != 'Success') {
          residencecheck = 'Residence certificates need to be verified';
          residencecolor = Colors.red;
        } else {
          residencecheck = 'Residence certificates are verified';
          residencecolor = Colors.green;
        }

        if (academy == 'Success' && residence == 'Success' && caste == 'Success' && category == 'Success') {
          verifistatus = 'All Documents are verified';
          main = Colors.green;
        }
        else{
          verifistatus = 'Verification process need to be done';
          main = Colors.red;
        }
      });
    } else {
      academy = '';
      residence = '';
      caste = '';
      category = '';
    }
  }

  dbname() async{
    final users = FirebaseAuth.instance.currentUser;
    final uid = users?.uid;
    final getname = FirebaseFirestore.instance.collection('NUsers').doc(uid);

    final getusers = await getname.get();

    if(getusers.exists){
      final datas = getusers.data();
      //print(datas);
      setState(() {
        name = datas!['Name'] ?? '';
        reg = datas['RegNo'];
        print(reg);
      });
    }
    else{
      setState(() {
        name = '';
        reg = '';
      });
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbStatus();
    dbname();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Verification status',
            style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              child: Text('App. no : $reg',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold),),
            ),
            Text(
              'Process',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
            Text(
              '$verifistatus',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: main,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Card(
              child: ClipPath(
                child: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(color: residencecolor, width: 6)),
                  ),
                  child: ListTile(
                    title: Text(
                      'Residence verification',
                      style: BoldPoppins(),
                    ),
                    subtitle: Text(
                      '$residencecheck',
                      style: NormalPoppins(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ClipPath(
                child: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border:
                        Border(left: BorderSide(color: castecolor, width: 6)),
                  ),
                  child: ListTile(
                    title: Text(
                      'Caste Certificate',
                      style: BoldPoppins(),
                    ),
                    subtitle: Text(
                      '$castecheck',
                      style: NormalPoppins(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ClipPath(
                child: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(color: categorycolor, width: 6)),
                  ),
                  child: ListTile(
                    title: Text(
                      'Category Certificate',
                      style: BoldPoppins(),
                    ),
                    subtitle: Text(
                      '$categorycheck',
                      style: NormalPoppins(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ClipPath(
                child: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: academycolor, width: 6),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      'Academic Certificate',
                      style: BoldPoppins(),
                    ),
                    subtitle: Text(
                      '$academycheck',
                      style: NormalPoppins(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle NormalPoppins() => TextStyle(fontFamily: 'Poppins');

  TextStyle BoldPoppins() =>
      TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold);
}
