import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/Neet%20Login/bottom.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final _password = TextEditingController();

  final _auth = FirebaseAuth.instance;

  bool passwordvalue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 100.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: const Text(
              'Melcome Back!!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Gothvetica',
                fontSize: 22.0,
                color: Color(0xFF555555),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16.0),
            child: const Text(
              'Enter the correct credentials.',
              style: TextStyle(
                color: Color(0xFF5F6769),
                fontFamily: 'Gothvetica',
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  hintText: 'Username',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 3.0,
                      color: Color(0xFF555555),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 3.0,
                      color: Color(0xFF555555),
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      username.clear();
                    },
                    icon: Icon(Icons.clear),
                    color: Color(0xFF555555),
                  ),
                ),
                cursorHeight: 18.0,
                cursorColor: Color(0xFF5F6769),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  hintText: 'Password',
                  //hintStyle: TextStyle(fontFamily: 'Source Sans Pro'),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 3.0,
                      color: Color(0xFF555555),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 3.0,
                      color: Color(0xFF555555),
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        if (passwordvalue == true) {
                          passwordvalue = false;
                        } else {
                          passwordvalue = true;
                        }
                      });
                    },
                    icon: Icon(Icons.lock),
                    color: Color(0xFF555555),
                  ),
                ),
                obscureText: passwordvalue,
                cursorHeight: 18.0,
                cursorColor: Color(0xFF5F6769),
                // keyboardType: TextInputType.visiblePassword,

                textInputAction: TextInputAction.done,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final user = await _auth.signInWithEmailAndPassword(
                    email: username.text, password: _password.text);
                if (user != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => bottom()));
                }
              } catch (e) {
                print(e);
              }

              // print(username.text);
              // print(_password.text);
              //Navigator.pushNamed(context, 'first_route');
              // Navigator.push(
              //   context,
              // MaterialPageRoute(builder:(context) => enter(),  ),
              // );
            },
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Fasthand',
                fontSize: 15.0,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF555555),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Remember Password ?',
            style: TextStyle(
              fontFamily: 'Gothvetica',
              fontSize: 16.0,
              color: Color(0xFF555555),
            ),
          )
        ],
      ),
    );
  }
}
