import 'package:flutter/material.dart';


Drawer buildDrawer() {
  return Drawer(
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
            onTap: (){

            } ,

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
            onTap: (){

            } ,
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
            onTap: () {},
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
            onTap: (){

            } ,
          ),
        ],
      ),
    ),
  );
}
