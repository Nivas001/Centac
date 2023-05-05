import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class ShowingNotification extends StatefulWidget {
  const ShowingNotification({Key? key}) : super(key: key);


  @override
  State<ShowingNotification> createState() => _ShowingNotificationState();
}

class _ShowingNotificationState extends State<ShowingNotification> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
