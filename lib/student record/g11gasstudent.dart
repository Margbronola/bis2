import 'package:bis/global/widget.dart';
import 'package:bis/student%20record/addstudent.dart';
import 'package:bis/student%20record/studdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Grade11GASStudentPage extends StatefulWidget {
  const Grade11GASStudentPage({super.key});

  @override
  State<Grade11GASStudentPage> createState() => _Grade11GASStudentPageState();
}

class _Grade11GASStudentPageState extends State<Grade11GASStudentPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent.shade100,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "GRADE 11 GAS",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 100,
              height: 70,
              child: MaterialButton(
                elevation: 0,
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: AddStudentPage(
                          level: 11,
                          grade: 11,
                          strand: "GAS",
                        ),
                        type: PageTransitionType.leftToRight),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.person_add_alt_rounded),
                    Text("New Data")
                  ],
                ),
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Student")
                  .where("grade", isEqualTo: "11")
                  .where("strand", isEqualTo: "GAS")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && !snapshot.hasError) {
                  final result = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemCount: result.size,
                    itemBuilder: (_, i) {
                      final stud = result.docs[i];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: StudentDataPage(
                                data: stud.data(),
                                uid: stud.id,
                              ),
                              type: PageTransitionType.fade,
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyWidget().text(
                                text:
                                    "${stud.get("lastname") != null ? "${stud.get("lastname")}" : ""}, ${stud.get("firstname") != null ? "${stud.get("firstname")}" : ""}"
                                        .toUpperCase(),
                                align: TextAlign.center,
                                fontWeight: FontWeight.bold,
                                size: 18,
                              ),
                              MyWidget().text(
                                text:
                                    "${stud.get("grade") != null ? "${stud.get("grade")}" : ""} ${stud.get("strand") != null ? "${stud.get("strand")}" : ""} - ${stud.get("section") != null ? "${stud.get("section")}" : ""}",
                                align: TextAlign.center,
                                color: Colors.grey.shade800,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return MyWidget().loader();
              },
            ),
          ],
        ),
      ),
    );
  }
}
