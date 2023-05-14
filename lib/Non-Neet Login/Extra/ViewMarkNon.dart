import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewMarksNon extends StatefulWidget {
  const ViewMarksNon({Key? key}) : super(key: key);

  @override
  State<ViewMarksNon> createState() => _ViewMarksNonState();
}

class _ViewMarksNonState extends State<ViewMarksNon> {
  final users = FirebaseAuth.instance.currentUser!.uid.toString();
  final userstream = FirebaseFirestore.instance.collection('marks').snapshots();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbMark();
    print('Name : $Name');
    print('reg : $Reg');
  }

  var sub1 = '';
  var sub2 = '';
  var sub3 = '';
  var sub4 = '';

  String group = '';


  late var datas = '';
  int mark1 = 0;
  int mark2 = 0;
  int mark3 = 0;
  int mark4 = 0;
  int tot = 0;
  double per = 0;

  int Acc = 0;
  int Commerce = 0;
  int Computer_app = 0;
  int Economics = 0;
  int English = 0;
  int Lang = 0;
  int Bio = 0;
  int Che = 0;
  int Phy = 0;
  int Maths = 0;
  int Computer_Sci = 0;
  String Name = '';
  String Reg = '';

  dbMark() async {
    final user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    final docRef = FirebaseFirestore.instance.collection('marks').doc(uid);

    final documentSnapshot = await docRef.get();

    if (documentSnapshot.exists) {
      final data = documentSnapshot.data();
      print(data);
      datas = data.toString();
      setState(() {
        Name = data!['Name'] ?? '';
        Reg = data!['Reg'] ?? '';
        Acc = data!['Accountancy'];
        Commerce = data!['Commerce'];
        Economics = data!['Economics'];
        Computer_Sci = data!['Com_Sci'];
        Phy = data!['Physics'];
        Che = data!['Chemistry'];
        Bio = data!['Biology'];
        Maths = data!['Maths'];
        Lang = data!['Language'];
        English = data!['English'];
        if (Acc == 0) {
          sub1 = 'Maths';
          mark1 = Maths;
        } else {
          sub1 = 'Accountancy';
          mark1 = Acc;
        }
        if (Commerce == 0) {
          sub2 = 'Physics';
          mark2 = Phy;
        } else {
          sub2 = 'Commerce';
          mark2 = Commerce;
        }
        if (Computer_app == 0) {
          sub3 = 'Chemistry';
          mark3 = Che;
        } else {
          sub3 = 'Computer Application';
          mark3 = Computer_app;
        }
        if (Economics == 0 && Computer_Sci ==0 ) {
          sub4 = 'Biology';
          mark4 = Bio;
          group = 'Biology';
        } else if(Bio == 0 && Computer_Sci == 0){
          sub4 = 'Economics';
          mark4 = Economics;
          group = 'Commerce';
        }else{
          sub4 = 'Computer Science';
          mark4 = Computer_Sci;
          group = 'Computer';
        }

        tot = Lang + English + mark1 + mark2 + mark3 + mark4;
        per = tot/6;

      });
    } else {
      setState(() {
        Acc = 0;
        Commerce = 0;
        Computer_app = 0;
        Economics = 0;
        English = 0;
        Lang = 0;
        Bio = 0;
        Che = 0;
        Phy = 0;
        Maths = 0;
        Computer_Sci = 0;
        Name = '';
        Reg = '';
      });
    }
  }
  onBack() async{
    Navigator.pop(context);
  }

  final FirebaseAuth auth1 = FirebaseAuth.instance;
  late User? user = auth1.currentUser;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
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
                  '    Name : $Name\nApp. no. : $Reg\n   Group : $group',
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
                      Text('Language',style: BoldPoppins(),),
                    ),
                    DataCell(
                      Text('$Lang'),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Text('English',style: BoldPoppins(),),
                    ),
                    DataCell(
                      Text('$English'),
                    ),
                  ]),
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
                      Text('$per%',style: BoldPoppins(),),
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
