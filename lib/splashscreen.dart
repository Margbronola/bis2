import 'package:bis/admindashboard.dart';
import 'package:bis/global/container.dart';
import 'package:bis/global/datacacher.dart';
import 'package:bis/global/widget.dart';
import 'package:bis/insdashboard.dart';
import 'package:bis/landing.dart';
import 'package:bis/login.dart';
import 'package:bis/studdashboard.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final DataCacher _cacher = DataCacher.instance;

  checker() async {
    String? d = _cacher.token;
    String? p = _cacher.pages;
    String? _uid = _cacher.uid;
    print("ACCESS TOKEN: $d");
    print("USER ID: $_uid");
    print("PAGE: $p");

    if (d == null) {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: const LandingPage(),
          type: PageTransitionType.fade,
        ),
      );
    } else {
      setState(() {
        accesstoken = d;
        page = p;
        uid = _uid;
      });
      if (page == "Instructor") {
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: const InstructorDashboardPage(),
            type: PageTransitionType.fade,
          ),
        );
      } else if (page == "Student") {
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: const StudDashboardPage(),
            type: PageTransitionType.fade,
          ),
        );
      } else {
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: const AdminDashboardPage(),
            type: PageTransitionType.fade,
          ),
        );
      }
    }
  }

  @override
  void initState() {
    checker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/school_logo.jpeg',
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 10),
            Center(
              child: LoadingAnimationWidget.prograssiveDots(
                  color: Colors.greenAccent.shade700, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}
