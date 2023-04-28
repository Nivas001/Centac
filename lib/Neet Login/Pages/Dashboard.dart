import 'package:flutter/material.dart';
import 'package:login/Neet Login/Neet_drawer.dart';

import 'dart:convert';

class Dash_neet extends StatefulWidget {
  const Dash_neet({Key? key}) : super(key: key);

  @override
  State<Dash_neet> createState() => _Dash_neetState();
}

class _Dash_neetState extends State<Dash_neet> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
        title: const Text(
          'DASHBOARD',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
          ),
        ),
        elevation: 10.0,
      ),
      drawer: buildDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
              columns:  [
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
    return TextStyle(fontFamily: 'SF-Compact',
          fontWeight: FontWeight.bold,);
  }
  // for making text bold
  TextStyle SF() => TextStyle(fontFamily: 'SF-Compact');
}
