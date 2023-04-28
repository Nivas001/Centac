import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(7.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: const Offset(1.0, 3.0),
                      blurRadius: 1.2,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/logo.png',
                        height: 85.0,
                      ),
                      SafeArea(
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              'GOVERNMENT OF PUDUCHERRY',
                              style: TextStyle(
                                fontFamily: 'SF-Compact',
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              'DIRECTORATE OF HIGHER AND TECHNICAL EDUCATION',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'SF-Compact',
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '           CENTRALISED ADMISSION COMMITTEE   '
                              '\n                                (CENTAC) 2022-23     ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SF-Compact',
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      height: 265.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blueGrey.shade200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/pgneet.png',
                              height: 100.0,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            const Center(
                              child: Text(
                                'UG-NEET',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Color(0xFF1A73E8),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            const Text(
                              'Medical / Dental / BAMS Ayurveda /'
                              ' (B.V.Sc.&A.H. National SS & NRI)',
                              style: TextStyle(
                                fontFamily: 'SF-Compact',
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'login');
                              },
                              child: Text(
                                'Dashboard',
                                style: TextStyle(fontFamily: 'SF-Compact'),
                              ),
                              color: Colors.deepPurple.shade400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      height: 265.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blueGrey.shade200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            // CircleAvatar(
                            //   backgroundImage: AssetImage('images/nonneet.png'),
                            //   radius: 45,
                            //   backgroundColor: Colors.white,
                            // ),
                            Image.asset(
                              'images/nonneet.png',
                              height: 80.0,
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            const Center(
                              child: Text(
                                'UG-NON NEET',
                                style: TextStyle(
                                  color: Color(0xFF1A73E8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            const Text(
                              'B.Tech./ B.Sc. (Hons.) Agri.& Horti./ B.V.Sc.&A.H./'
                              ' B.Sc.(Nursing/M.L.T/M.R.I.T)/ B.P.T. /B.Pharm./ '
                              'B.A.LLB.& (B.A./ B.Sc./ B.Com./ B.B.A./ B.C.A.) ',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'SF-Compact',
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'login');
                              },
                              child: Text(
                                'Dashboard',
                                style: TextStyle(fontFamily: 'SF-Compact'),
                              ),
                              color: Colors.deepPurple.shade400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings'
          ),
        ],
      ),
    );
  }
}
