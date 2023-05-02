import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Merit_mark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedItem = 0;

  final List<Widget> _pages = [
    Biology(),
    ComputerScience(),
    Commerce(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedItem = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Merit Mark Calculation'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Biology'),
              selected: _selectedItem == 0,
              onTap: () => _onItemSelected(0),
            ),
            ListTile(
              title: Text('Computer Science'),
              selected: _selectedItem == 1,
              onTap: () => _onItemSelected(1),
            ),
            ListTile(
              title: Text('Commerce'),
              selected: _selectedItem == 2,
              onTap: () => _onItemSelected(2),
            ),
          ],
        ),
      ),
      body: _pages[_selectedItem],
    );
  }
}

class Biology extends StatefulWidget {
  const Biology({Key? key}) : super(key: key);

  @override
  State<Biology> createState() => _BiologyState();
}

class _BiologyState extends State<Biology> {
  final language = TextEditingController();
  final english = TextEditingController();
  final maths = TextEditingController();
  final biology = TextEditingController();
  final physics = TextEditingController();
  final chemistry = TextEditingController();

  late String language1 = language.text;
  late int lang = int.parse(language1);

  late String eng1 = english.text;
  late int eng = int.parse(eng1);

  late String maths1 = maths.text;
  late int mat = int.parse(maths1);

  late String bio1 = biology.text;
  late int bio = int.parse(bio1);

  late String phy1 = physics.text;
  late int phy = int.parse(phy1);

  late String che1 = chemistry.text;
  late int che = int.parse(che1);

  late int total = lang + eng + mat + bio + phy + che;

  late String tot = total.toString();
  late double per = total/6;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /*appBar: AppBar(
          title: Text(
            'Biology :',
            style: TextStyle(fontFamily: 'Cinzel', fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),*/
        body: ListView(
          children: [
            Column(
              children: [
                Text('Biology :'),
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
                ElevatedButton(
                    onPressed: () {
                      print(total);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text('Merit mark'),
                              content: new Text('Total : $total \nPercentage : $per'),
                              actions: [
                                new CupertinoDialogAction(
                                  child: new Text('ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    },
                    child: Text('Calculate'))
              ],
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}



class ComputerScience extends StatefulWidget {
  const ComputerScience({Key? key}) : super(key: key);

  @override
  State<ComputerScience> createState() => _ComputerScienceState();
}

class _ComputerScienceState extends State<ComputerScience> {
  final language = TextEditingController();
  final english = TextEditingController();
  final maths = TextEditingController();
  final compsci = TextEditingController();
  final physics = TextEditingController();
  final chemistry = TextEditingController();

  late String language1 = language.text;
  late int lang = int.parse(language1);

  late String eng1 = english.text;
  late int eng = int.parse(eng1);

  late String maths1 = maths.text;
  late int mat = int.parse(maths1);

  late String cs1 = compsci.text;
  late int cs = int.parse(cs1);

  late String phy1 = physics.text;
  late int phy = int.parse(phy1);

  late String che1 = chemistry.text;
  late int che = int.parse(che1);

  late int total = lang + eng + mat + cs + phy + che;

  late String tot = total.toString();
  late double per = total/6;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /*appBar: AppBar(
          title: Text(
            'Computer Science :',
            style: TextStyle(fontFamily: 'Cinzel', fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),*/
        body: ListView(
          children: [
            Column(
              children: [
                Text('Computer Science :'),
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
                  cont_subject: compsci,
                  subject: 'Computer Science',
                ),
                ElevatedButton(
                    onPressed: () {
                      print(total);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text('Merit mark'),
                              content: new Text('Total : $total \nPercentage : $per'),
                              actions: [
                                new CupertinoDialogAction(
                                  child: new Text('ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    },
                    child: Text('Calculate'))
              ],
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


class Commerce extends StatefulWidget {
  const Commerce({Key? key}) : super(key: key);

  @override
  State<Commerce> createState() => _CommerceState();
}

class _CommerceState extends State<Commerce> {
  final language = TextEditingController();
  final english = TextEditingController();
  final Accounting = TextEditingController();
  final Economics = TextEditingController();
  final Commerce = TextEditingController();
  final ComputerApp = TextEditingController();

  late String language1 = language.text;
  late int lang = int.parse(language1);

  late String eng1 = english.text;
  late int eng = int.parse(eng1);

  late String acc1 = Accounting.text;
  late int acc = int.parse(acc1);

  late String ca1 = ComputerApp.text;
  late int ca = int.parse(ca1);

  late String eco1 = Economics.text;
  late int eco = int.parse(eco1);

  late String comm1 = Commerce.text;
  late int comm = int.parse(comm1);

  late int total = lang + eng + acc + ca + eco + comm;

  late String tot = total.toString();
  late double per = total/6;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /*appBar: AppBar(
          title: Text(
            'Commerce :',
            style: TextStyle(fontFamily: 'Cinzel', fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),*/
        body: ListView(
          children: [
            Column(
              children: [
                Text('Commerce :'),
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
                  cont_subject: Accounting,
                  subject: 'Accounts',
                ),
                TextInput(
                  cont_subject: Economics,
                  subject: 'Economics',
                ),
                TextInput(
                  cont_subject: Commerce,
                  subject: 'Commerce',
                ),
                TextInput(
                  cont_subject: ComputerApp,
                  subject: 'Computer Applications',
                ),
                ElevatedButton(
                    onPressed: () {
                      print(total);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text('Merit mark'),
                              content: new Text('Total : $total \nPercentage : $per'),
                              actions: [
                                new CupertinoDialogAction(
                                  child: new Text('ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    },
                    child: Text('Calculate'))
              ],
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
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