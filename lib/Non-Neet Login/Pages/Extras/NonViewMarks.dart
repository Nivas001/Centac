import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NonViewMarks extends StatefulWidget {
  const NonViewMarks({Key? key}) : super(key: key);

  @override
  State<NonViewMarks> createState() => _NonViewMarksState();
}

class _NonViewMarksState extends State<NonViewMarks> {

  String name = '';
  String reg = '';
  String group = '';

  int mark1 = 0;
  int mark2 = 0;
  int mark3 = 0;
  int mark4 = 0;
  int mark5 = 0;
  int mark6 = 0;

  int tot = 0;
  double per = 0;
  String percent = '';

  String sub1 = '';
  String sub2 = '';
  String sub3 = '';
  String sub4 = '';
  String sub5 = '';
  String sub6 = '';

  final users = FirebaseAuth.instance.currentUser!.uid.toString();
  final userstream = FirebaseFirestore.instance.collection('marks').snapshots();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbMark();
    dbname();

  }



  dbMark() async {
    final user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    final docRef = FirebaseFirestore.instance.collection('marks').doc(uid);

    final documentSnapshot = await docRef.get();

    if (documentSnapshot.exists) {
      final data = documentSnapshot.data();
      print(data);

      setState(() {
        sub1 = data!['Subject_name_1'] ?? '';
        sub2 = data['Subject_name_2'] ;
        sub3 = data['Subject_name_3'];
        sub4 = data['Subject_name_4'];
        sub5 = data['Subject_name_5'];
        sub6 = data['Subject_name_6'];


        mark1 = data['Subject_mark_1'];
        mark2 = data['Subject_mark_2'];
        mark3 = data['Subject_mark_3'];
        mark4 = data['Subject_mark_4'];
        mark5 = data['Subject_mark_5'];
        mark6 = data['Subject_mark_6'];

        tot = mark1+mark2+mark3+mark4+mark5+mark6;
        per = tot/6;
        percent = per.toStringAsFixed(2);
      });
    } else {
      setState(() {
        sub1 = '';
        sub2 = '';
        sub3 = '';
        sub4 = '';
        sub5 = '';
        sub6 = '';

        mark1 = 0;
        mark2 = 0;
        mark3 = 0;
        mark4 = 0;
        mark5 = 0;
        mark6 = 0;

      });
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


  final FirebaseAuth auth1 = FirebaseAuth.instance;
  late User? user = auth1.currentUser;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        print('The back button is called to function');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'View Your Marks',
            style: BoldPoppins(),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          ),
          centerTitle: true,
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.0,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white30,
                ),
                child: Text(
                  '    Name : $name\nReg. no. : $reg\n   Group : $sub6',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            DataTable(
                dataRowHeight: 70,
                dividerThickness: 2,
                columnSpacing: 120.0,
                columns: [
                  DataColumn(
                    label: Text('Subject',style: BoldPoppins(),),
                  ),
                  DataColumn(
                    label: Text('Mark',style: BoldPoppins(),),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(
                      Text('$sub1',style: BoldPoppins(),),
                    ),
                    DataCell(
                      Text('$mark1'),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Text('$sub2',style: BoldPoppins(),),
                    ),
                    DataCell(
                      Text('$mark2'),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Text('$sub3',style: BoldPoppins(),),
                    ),
                    DataCell(
                      Text('$mark3'),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Text('$sub4',style: BoldPoppins(),),
                    ),
                    DataCell(
                      Text('$mark4'),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Text('$sub5',style: BoldPoppins(),),
                    ),
                    DataCell(
                      Text('$mark5'),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Text('$sub6',style: BoldPoppins(),),
                    ),
                    DataCell(
                      Text('$mark6'),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Text('Total',style: BoldPoppins(),),
                    ),
                    DataCell(
                      Text('$tot\/600',style: BoldPoppins(),),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Text('Percentage',style: BoldPoppins(),),
                    ),
                    DataCell(
                      Text('$percent\%',style: BoldPoppins(),),
                    ),
                  ]),
                ]),
          ],
        ),
      ),
    );
  }

  TextStyle BoldPoppins() => TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold);
}
