import 'package:flutter/material.dart';

class ShowingNotification extends StatefulWidget {
  const ShowingNotification({Key? key}) : super(key: key);

  @override
  State<ShowingNotification> createState() => _ShowingNotificationState();
}

class _ShowingNotificationState extends State<ShowingNotification> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(13),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        });
  }
}