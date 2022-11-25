import 'package:bis/addgrade.dart';
import 'package:bis/global/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

class GradingPage extends StatefulWidget {
  const GradingPage({super.key});

  @override
  State<GradingPage> createState() => _GradingPageState();
}

class _GradingPageState extends State<GradingPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent.shade100,
        foregroundColor: Colors.black,
        title: const Text(
          "GRADING",
          style: TextStyle(letterSpacing: 2),
        ),
        centerTitle: true,
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
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Student")
                    .orderBy("lastname")
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
                                child: AddGradePage(
                                  data: stud,
                                  studId: stud.id,
                                ),
                                type: PageTransitionType.bottomToTop,
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyWidget().text(
                                    text:
                                        "${stud.get("lastname") != null ? "${stud.get("lastname")}" : ""}, ${stud.get("firstname") != null ? "${stud.get("firstname")}" : ""}"
                                            .toUpperCase(),
                                    align: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                    size: 18),
                                MyWidget().text(
                                    text:
                                        "${stud.get("grade") != null ? "${stud.get("grade")}" : ""} ${stud.get("section") != null ? "${stud.get("section")}" : ""}",
                                    align: TextAlign.center,
                                    color: Colors.grey.shade800),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return MyWidget().loader();
                }),
          ],
        ),
      ),
    );
  }
}
