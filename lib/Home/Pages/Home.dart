import 'package:flutter/material.dart';
import 'package:login/Home/login.dart';

import '../../Non-Neet Login/Login/LoginNon.dart';

  double containerheight = 0;
  double imageheight = 0;
  double sizebox = 0;
  double dashboardcontainer = 0;
  double ugneetimage = 0;
  double ugnon_neetimage = 0;
  double ugneetsizebox = 0;
  double ugnonneetsizebox = 0;
  double sizebox1 = 0;
  double padvalue = 0;

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {

    double phonewidth = MediaQuery.of(context).size.width;
    double phoneheight = MediaQuery.of(context).size.height;
    double phonetext = MediaQuery.of(context).textScaleFactor;
    print(phonewidth);
    print(phoneheight);
    print(phonetext);
    phoneheight = phoneheight.roundToDouble();
    print(phoneheight);
    containerheight = 0.137*phoneheight;
    containerheight = containerheight.roundToDouble();
    print(containerheight);
    imageheight = 0.0974*phoneheight;
    imageheight = imageheight.roundToDouble();
    print(imageheight);
    sizebox = 0.0137*phoneheight;
    sizebox = sizebox.roundToDouble();
    print(sizebox);
    dashboardcontainer = 0.303 *phoneheight;
    dashboardcontainer = dashboardcontainer.roundToDouble();
    print(dashboardcontainer);
    ugneetimage = 0.1145*phoneheight;
    ugneetimage = ugneetimage.roundToDouble();
    print(ugneetimage);
    ugnon_neetimage = 0.0916*phoneheight;
    ugnon_neetimage = ugnon_neetimage.roundToDouble();
    print(ugnon_neetimage);
    ugneetsizebox = 0.0286*phoneheight;
    ugneetsizebox = ugneetsizebox.roundToDouble();
    print(ugneetsizebox);
    ugnonneetsizebox = 0.0229*phoneheight;
    ugnonneetsizebox = ugnonneetsizebox.roundToDouble();
    print(ugnonneetsizebox);
    sizebox1 = 0.01145*phoneheight;
    sizebox1 = sizebox1.roundToDouble();
    print(sizebox1);
    padvalue = 0.0091*phoneheight;
    padvalue= padvalue.roundToDouble();
    print(padvalue);

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: containerheight,
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
                          height: imageheight,
                        ),
                        SafeArea(
                          child: Column(
                            children:  [
                              SizedBox(
                                height: sizebox,
                              ),
                              Text(
                                'GOVERNMENT OF PUDUCHERRY',
                                style: TextStyle(
                                  fontFamily: 'SF-Compact',
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                'DIRECTORATE OF HIGHER AND TECHNICAL EDUCATION',
                                style: TextStyle(
                                  fontSize: sizebox,
                                  fontFamily: 'SF-Compact',
                                ),
                              ),
                              SizedBox(
                                height: sizebox1,
                              ),
                              // Text(
                              //   '           CENTRALISED ADMISSION COMMITTEE   '
                              //       '\n                                (CENTAC) 2022-23     ',
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     fontFamily: 'SF-Compact',
                              //     fontSize: 16.0,
                              //   ),
                              // ),
                              Column(
                                children: [
                                  Text('CENTRALISED ADMISSION COMMITTEE',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SF-Compact',
                                fontSize: 16.0,
                              ),),
                                  Text('(CENTAC) 2022-23',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'SF-Compact',
                                    fontSize: 16.0,
                                  ),),
                                ],
                              )
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
                        height: dashboardcontainer,
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
                                height: ugneetimage,
                              ),
                              SizedBox(
                                height: padvalue,
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
                                height: padvalue,
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
                                height: ugneetsizebox,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
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
                        height: ugneetsizebox,
                      ),
                      Container(
                        height: dashboardcontainer,
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
                                height: ugnon_neetimage,
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
                                height: padvalue,
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
                                height: ugnonneetsizebox,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginNon()));
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
    );
  }
}
