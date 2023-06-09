import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/Home/home_bottom.dart';
import 'package:login/Neet%20Login/bottom.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final _password = TextEditingController();

  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  bool passwordvalue = true;

  var errormsg = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var user1 = username.toString();
    print('Anu user here : $user1');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        //showSpinner = false;
        print('The back button is pressed');
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_bottom()));
        return true;
      },
      child: Scaffold(
        body: BlurryModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
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
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: username.text, password: _password.text);
                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => bottom()));
                    }

                    // else
                    //   AlertDialog(
                    //     title: Text('User Credentials wrong'),
                    //     actions: [
                    //       TextButton(onPressed: ()=>Navigator.pop(context, 'Ok'), child: Text('OK'))
                    //     ],
                    //   );
                    // setState(() {
                    //   showSpinner = false;
                    // });
                  } catch (e) {
                    print('error :$e');
                    if(e == '[firebase_auth/unknown] Given String is empty or null'){
                      errormsg = 'Please enter Username/Password';
                    }
                    else
                      {
                        errormsg = 'Login Failed';
                      }
                    setState(() {
                      showSpinner = false;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: CustomSnackBar(),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      );
                    });

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
                '$errormsg',
                style: TextStyle(
                  fontFamily: 'Gothvetica',
                  fontSize: 16.0,
                  color: Color(0xFF555555),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: Color(0xFFC72C41),
            borderRadius:
                BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login Failed',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 18,
                      ),
                    ),

                    Text(
                      'Username/Password mismatched or left blank',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              'icon/bubbles.svg',
              height: 48,
              width: 40,
              //color: Color(0xFF801336),
              colorFilter: ColorFilter.mode(
                  Color(0xFF801336), BlendMode.srcIn),
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'icon/fail.svg',
                height: 40,
              ),
              Positioned(
                top: 10,
                  child: SvgPicture.asset(
                'icon/close.svg',
                height: 16,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
