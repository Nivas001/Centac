import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Merit_mark extends StatefulWidget {
  const Merit_mark({Key? key}) : super(key: key);

  @override
  State<Merit_mark> createState() => _Merit_markState();
}

class _Merit_markState extends State<Merit_mark> {
  final language = TextEditingController();
  final english = TextEditingController();
  final maths = TextEditingController();
  final biology = TextEditingController();
  final physics = TextEditingController();
  final chemistry = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Merit mark Calculation',
            style: TextStyle(fontFamily: 'Cinzel', fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextInput(
                  cont_subject: language,
                  subject: 'Language',
                ),
                TextInput(
                  cont_subject: english,
                  subject: 'English',
                ),
                TextInput(
                  cont_subject: maths,
                  subject: 'Maths',
                ),
                TextInput(
                  cont_subject: physics,
                  subject: 'Physics',
                ),
                TextInput(
                  cont_subject: chemistry,
                  subject: 'Chemistry',
                ),
                TextInput(
                  cont_subject: biology,
                  subject: 'Biology',
                ),
                ElevatedButton(onPressed: (){}, child: Text('Calculate'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.cont_subject,
    required this.subject,
  });

  final TextEditingController cont_subject;
  final subject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: cont_subject,
        maxLength: 3,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          hintText: subject,
          hintStyle: TextStyle(fontFamily: 'Cinzel'),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 3.0,
              color: Color(0xFF555555),
            ),
          ),
        ),
      ),
    );
  }
}
