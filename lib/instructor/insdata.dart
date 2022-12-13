import 'package:bis/global/widget.dart';
import 'package:bis/instructor/editinsdata.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class InstructorDataPage extends StatefulWidget {
  String uid;
  dynamic data;
  InstructorDataPage({super.key, required this.data, required this.uid});

  @override
  State<InstructorDataPage> createState() => _InstructorDataPageState();
}

class _InstructorDataPageState extends State<InstructorDataPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent.shade100,
        foregroundColor: Colors.black,
        centerTitle: true,
        actions: [
          Container(
            width: 110,
            height: 70,
            padding: const EdgeInsets.only(right: 20),
            child: MaterialButton(
              elevation: 0,
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: EditInstructorDataPage(
                        data: widget.data,
                        level: widget.data['grade'],
                        uid: widget.uid,
                      ),
                      type: PageTransitionType.leftToRight),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.edit_note_rounded),
                  Text("Edit Data")
                ],
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Container(
              width: size.width,
              color: Colors.greenAccent.shade100,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: MyWidget().text(
                text: "INFORMATION",
                size: 18,
                fontWeight: FontWeight.bold,
                align: TextAlign.center,
                letterSpacing: 2,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      MyWidget().text(
                          text: "Last Name : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['lastname'] != null
                                ? "${widget.data['lastname']}"
                                : "",
                            size: 16,
                            align: TextAlign.end),
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      MyWidget().text(
                          text: "First Name : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['firstname'] != null
                                ? "${widget.data['firstname']}"
                                : "",
                            size: 16,
                            align: TextAlign.end),
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      MyWidget().text(
                          text: "Email : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['email'] != null
                                ? "${widget.data['email']}"
                                : "",
                            size: 16,
                            align: TextAlign.end),
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      MyWidget().text(
                          text: "Phone Number : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['cellphone'] != null
                                ? "${widget.data['cellphone']}"
                                : "",
                            size: 16,
                            align: TextAlign.end),
                      )
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: size.width,
              color: Colors.greenAccent.shade100,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: MyWidget().text(
                text: "ADVISORY CLASS",
                size: 18,
                fontWeight: FontWeight.bold,
                align: TextAlign.center,
                letterSpacing: 2,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      MyWidget().text(
                          text: "Strand : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['strand'] != null
                                ? "${widget.data['strand']}"
                                : "",
                            size: 16,
                            align: TextAlign.end),
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      MyWidget().text(
                          text: "Grade : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['grade'] != null
                                ? "${widget.data['grade']}"
                                : "",
                            size: 16,
                            align: TextAlign.end),
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      MyWidget().text(
                          text: "Section : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['section'] != null
                                ? "${widget.data['section']}"
                                : "",
                            size: 16,
                            align: TextAlign.end),
                      )
                    ],
                  ),
                  const Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
