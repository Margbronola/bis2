import 'package:bis/instructor/addinstructor.dart';
import 'package:bis/global/widget.dart';
import 'package:bis/instructor/insdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class InstructorPage extends StatefulWidget {
  const InstructorPage({super.key});

  @override
  State<InstructorPage> createState() => _InstructorPageState();
}

class _InstructorPageState extends State<InstructorPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent.shade100,
        foregroundColor: Colors.black,
        actions: [
          SizedBox(
              width: 100,
              child: MaterialButton(
                elevation: 0,
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: const AddInstructorPage(),
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
              )),
          const SizedBox(width: 20),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            MyWidget().text(
              text: "INSTRUCTOR LIST",
              fontWeight: FontWeight.bold,
              size: 20,
              letterSpacing: 2,
              align: TextAlign.center,
            ),
            const SizedBox(height: 30),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Instructor")
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
                      final ins = result.docs[i];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: InstructorDataPage(
                                uid: ins.id,
                                data: ins.data(),
                              ),
                              type: PageTransitionType.leftToRight,
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyWidget().text(
                                text:
                                    "${ins.get("lastname") != null ? "${ins.get("lastname")}" : ""}, ${ins.get("firstname") != null ? "${ins.get("firstname")}" : ""}"
                                        .toUpperCase(),
                                align: TextAlign.center,
                                fontWeight: FontWeight.bold,
                                size: 18,
                              ),
                              MyWidget().text(
                                text: ins.get("email") != null
                                    ? "${ins.get("email")}"
                                    : "",
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
            )
          ],
        ),
      ),
    );
  }
}
