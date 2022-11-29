import 'package:bis/global/container.dart';
import 'package:bis/global/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AcadRecordPage extends StatefulWidget {
  const AcadRecordPage({super.key});

  @override
  State<AcadRecordPage> createState() => _AcadRecordPageState();
}

class _AcadRecordPageState extends State<AcadRecordPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent.shade100,
        foregroundColor: Colors.black,
        title: const Text(
          "ACADEMIC RECORDS",
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
            const SizedBox(height: 20),
            Row(
              children: const [
                Text("Quarter : ", style: TextStyle(fontSize: 20)),
                Text("1st Semester",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
            Container(
              color: Colors.grey.shade400,
              margin: const EdgeInsets.only(top: 15, bottom: 10),
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      "SUBJECT",
                      style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    child: Text(
                      "GRADE",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Student")
                  .doc(uid)
                  .collection("Grade")
                  .where("sem", isEqualTo: "1")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && !snapshot.hasError) {
                  final result = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: result.size,
                    itemBuilder: (_, i) {
                      final doc = result.docs[i];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${doc.get('subject')}",
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              child: Text(
                                "${doc.get('grade')}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
                return MyWidget().loader();
              },
            ),
            const SizedBox(height: 30),
            DottedBorder(
              color: const Color.fromARGB(255, 139, 139, 139),
              dashPattern: const [5, 6],
              customPath: (size) {
                return Path()
                  ..moveTo(0, 5)
                  ..lineTo(size.width, 5);
              },
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Container(),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: const [
                Text("Quarter : ", style: TextStyle(fontSize: 20)),
                Text("2nd Semester",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
            Container(
              color: Colors.grey.shade400,
              margin: const EdgeInsets.only(top: 15, bottom: 10),
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      "SUBJECT",
                      style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    child: Text(
                      "GRADE",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Student")
                  .doc(uid)
                  .collection("Grade")
                  .where("sem", isEqualTo: "2")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && !snapshot.hasError) {
                  final result = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: result.size,
                    itemBuilder: (_, i) {
                      final doc = result.docs[i];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${doc.get('subject')}",
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              child: Text(
                                "${doc.get('grade')}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
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
