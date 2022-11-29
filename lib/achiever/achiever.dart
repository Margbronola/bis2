import 'package:bis/achiever/addacheiver.dart';
import 'package:bis/achiever/g10achiever.dart';
import 'package:bis/achiever/g11GASachiever.dart';
import 'package:bis/achiever/g11TVLachiever.dart';
import 'package:bis/achiever/g12GASachiever.dart';
import 'package:bis/achiever/g12TVLachiever.dart';
import 'package:bis/achiever/g7achiever.dart';
import 'package:bis/achiever/g8achiever.dart';
import 'package:bis/achiever/g9achiever.dart';
import 'package:bis/global/widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AchieverPage extends StatefulWidget {
  const AchieverPage({super.key});

  @override
  State<AchieverPage> createState() => _AchieverPageState();
}

class _AchieverPageState extends State<AchieverPage> {
  // final DataCacher _cacher = DataCacher.instance;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // String? p = _cacher.pages;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent.shade100,
        foregroundColor: Colors.black,
        title: const Text(
          "ACHIEVER STUDENT",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const Grade7AchieverPage(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MyWidget().text(
                    text: "GRADE 7",
                    fontWeight: FontWeight.bold,
                    size: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const Grade8AchieverPage(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MyWidget().text(
                    text: "GRADE 8",
                    fontWeight: FontWeight.bold,
                    size: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const Grade9AchieverPage(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MyWidget().text(
                    text: "GRADE 9",
                    fontWeight: FontWeight.bold,
                    size: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const Grade10AchieverPage(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MyWidget().text(
                    text: "GRADE 10",
                    fontWeight: FontWeight.bold,
                    size: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const Grade11GASAchieverPage(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MyWidget().text(
                    text: "GRADE 11 (GAS)",
                    fontWeight: FontWeight.bold,
                    size: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const Grade11TVLAchieverPage(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MyWidget().text(
                    text: "GRADE 11 (TVL)",
                    fontWeight: FontWeight.bold,
                    size: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const Grade12GASAchieverPage(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MyWidget().text(
                    text: "GRADE 12 (GAS)",
                    fontWeight: FontWeight.bold,
                    size: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const Grade12TVLAchieverPage(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MyWidget().text(
                    text: "GRADE 12 (TVL)",
                    fontWeight: FontWeight.bold,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
