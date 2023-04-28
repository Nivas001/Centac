import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,color: Colors.black,),
        title: Text('Notifications',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(child: Text(' Notifications page is in Build Preview!!\n Nothing here Upto now also\n Trying to process the Notifications in the backend',
      style: TextStyle(fontFamily: 'Cinzel',fontWeight: FontWeight.bold),
      ),),
    );
  }
}
