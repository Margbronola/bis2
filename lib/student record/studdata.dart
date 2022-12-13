// ignore_for_file: must_be_immutable

import 'package:bis/global/widget.dart';
import 'package:bis/student%20record/editdata.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class StudentDataPage extends StatefulWidget {
  String uid;
  dynamic data;
  StudentDataPage({super.key, required this.data, required this.uid});

  @override
  State<StudentDataPage> createState() => _StudentDataPageState();
}

class _StudentDataPageState extends State<StudentDataPage> {
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
                      child: EditDataPage(
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
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            Container(
              width: size.width,
              color: Colors.greenAccent.shade100,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: MyWidget().text(
                text: "PERSONAL INFORMATION",
                size: 18,
                fontWeight: FontWeight.bold,
                align: TextAlign.center,
                letterSpacing: 2,
                color: Colors.grey.shade400,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      MyWidget().text(
                          text: "LRN : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['lrn'] != null
                                ? "${widget.data['lrn']}"
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
                  widget.data['strand'] != null
                      ? Row(
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
                        )
                      : Container(),
                  widget.data['strand'] != null ? const Divider() : Container(),
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
                          text: "Address : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['address'] != null
                                ? "${widget.data['address']}"
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
                          text: "Gender : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['gender'] != null
                                ? "${widget.data['gender']}"
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
                          text: "Birthday : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['birthday'] != null
                                ? "${widget.data['birthday']}"
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
                          text: "Religion : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['religion'] != null
                                ? "${widget.data['religion']}"
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
                            text: widget.data['phoneNumber'] != null
                                ? "${widget.data['phoneNumber']}"
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
            const SizedBox(height: 20),
            Container(
              width: size.width,
              color: Colors.greenAccent.shade100,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: MyWidget().text(
                text: "PARENTS/GUARDIAN",
                size: 18,
                fontWeight: FontWeight.bold,
                align: TextAlign.center,
                letterSpacing: 2,
                color: Colors.grey.shade400,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      MyWidget().text(
                          text: "Father : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['father'] != null
                                ? "${widget.data['father']}"
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
                          text: "Occupation : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['fatherOccupation'] != null
                                ? "${widget.data['fatherOccupation']}"
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
                          text: "Mother : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['mother'] != null
                                ? "${widget.data['mother']}"
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
                          text: "Occupation : ",
                          fontWeight: FontWeight.bold,
                          size: 15),
                      Expanded(
                        child: MyWidget().text(
                            text: widget.data['motherOccupation'] != null
                                ? "${widget.data['motherOccupation']}"
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
