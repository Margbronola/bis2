import 'package:bis/student%20record/addstudent.dart';
import 'package:bis/global/widget.dart';
import 'package:bis/student%20record/g10student.dart';
import 'package:bis/student%20record/g11gasstudent.dart';
import 'package:bis/student%20record/g11tvlstudent.dart';
import 'package:bis/student%20record/g12gasstudent.dart';
import 'package:bis/student%20record/g12tvlstudent.dart';
import 'package:bis/student%20record/g7student.dart';
import 'package:bis/student%20record/g8student.dart';
import 'package:bis/student%20record/g9student.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class StudentRecordPage extends StatefulWidget {
  const StudentRecordPage({super.key});

  @override
  State<StudentRecordPage> createState() => _StudentRecordPageState();
}

class _StudentRecordPageState extends State<StudentRecordPage> {
  String searchString = "";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent.shade100,
        foregroundColor: Colors.black,
        // actions: [
        //   SizedBox(
        //       width: 100,
        //       child: MaterialButton(
        //         elevation: 0,
        //         padding: const EdgeInsets.all(0),
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             PageTransition(
        //                 child: AddStudentPage(),
        //                 type: PageTransitionType.leftToRight),
        //           );
        //         },
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: const [
        //             Icon(Icons.person_add_alt_rounded),
        //             Text("New Data")
        //           ],
        //         ),
        //       )),
        //   const SizedBox(width: 20),
        // ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            MyWidget().text(
                text: "STUDENT LIST",
                fontWeight: FontWeight.bold,
                size: 20,
                letterSpacing: 2,
                align: TextAlign.center),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const Grade7StudentPage(),
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
                    child: const Grade8StudentPage(),
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
                    child: const Grade9StudentPage(),
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
                    child: const Grade10StudentPage(),
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
                    child: const Grade11GASStudentPage(),
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
                    child: const Grade11TVLStudentPage(),
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
                    child: const Grade12GASStudentPage(),
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
                    child: const Grade12TVLStudentPage(),
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
    );
  }
}
