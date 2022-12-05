import 'package:bis/aboutus.dart';
import 'package:bis/acadrecord.dart';
import 'package:bis/achiever/achiever.dart';
import 'package:bis/global/datacacher.dart';
import 'package:bis/global/widget.dart';
import 'package:bis/landing.dart';
import 'package:bis/services/auth.dart';
import 'package:bis/student%20record/studinfo.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class StudDashboardPage extends StatefulWidget {
  const StudDashboardPage({super.key});

  @override
  State<StudDashboardPage> createState() => _StudDashboardPageState();
}

class _StudDashboardPageState extends State<StudDashboardPage> {
  final Authentication _auth = Authentication();
  final DataCacher cacher = DataCacher.instance;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.greenAccent.shade100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.exit_to_app_rounded,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () async {
                setState(() {
                  isloading = true;
                });
                await _auth.signout().whenComplete(() {
                  cacher.deleteToken();
                  setState(() {
                    isloading = false;
                  });
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      child: const LandingPage(),
                      type: PageTransitionType.fade,
                    ),
                  );
                });
              },
            ),
          ),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: Colors.white,
              child: Stack(
                children: [
                  ListView(
                    children: [
                      Container(
                        height: size.height * .30,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(200),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * .5,
                        width: size.width,
                        color: Colors.greenAccent.shade100,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(300),
                              bottomLeft: Radius.circular(400),
                              bottomRight: Radius.circular(200),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * .1,
                        color: Colors.greenAccent.shade100,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 30, bottom: 35),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "BAGACAY INTEGRATED SCHOOL",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'JosefinSans'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: GridView.extent(
                            maxCrossAxisExtent: 250,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 30,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: const StudentInfoPage(),
                                      type: PageTransitionType.bottomToTop,
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/identification.png',
                                        height: 55,
                                        width: 55,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Student Information",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: const AcadRecordPage(),
                                      type: PageTransitionType.bottomToTop,
                                    ),
                                  );
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/grade.png',
                                        height: 55,
                                        width: 55,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Academic Records",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: const AchieverPage(),
                                      type: PageTransitionType.bottomToTop,
                                    ),
                                  );
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/medal.png',
                                        height: 55,
                                        width: 55,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Academic Achievers",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: const AboutUsPage(),
                                      type: PageTransitionType.bottomToTop,
                                    ),
                                  );
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/info.png',
                                        height: 55,
                                        width: 55,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "About School",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            isloading ? MyWidget().loader() : Container()
          ],
        ),
      ),
    );
  }
}
