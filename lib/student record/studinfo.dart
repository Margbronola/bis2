import 'package:bis/global/container.dart';
import 'package:bis/global/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentInfoPage extends StatefulWidget {
  const StudentInfoPage({super.key});

  @override
  State<StudentInfoPage> createState() => _StudentInfoPageState();
}

class _StudentInfoPageState extends State<StudentInfoPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "STUDENT INFORMATION",
          style: TextStyle(letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * .17,
              decoration: const BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                  bottomRight: Radius.circular(90),
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Student")
                    .doc(uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && !snapshot.hasError) {
                    final docs = snapshot.data!;
                    return Column(
                      children: [
                        Container(
                          width: size.width,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 35,
                            vertical: 20,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyWidget().text(
                                  text:
                                      "${docs.get("firstname") != null ? "${docs.get("firstname")}" : ""} ${docs.get("lastname") != null ? "${docs.get("lastname")}" : ""}"
                                          .toUpperCase(),
                                  align: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                  size: 18),
                              SizedBox(height: size.height * .008),
                              MyWidget().text(
                                  text: docs.get("lrn") != null
                                      ? "${docs.get("lrn")}"
                                      : "",
                                  align: TextAlign.center,
                                  size: 17),
                              SizedBox(height: size.height * .005),
                              MyWidget().text(
                                  text:
                                      "${docs.get("grade") != null ? "${docs.get("grade")}" : ""} ${docs.get("section") != null ? "${docs.get("section")}" : ""}",
                                  align: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                  size: 17)
                            ],
                          ),
                        ),
                        Expanded(
                            child: ListView(
                          children: [
                            Container(
                                width: size.width,
                                color: Colors.greenAccent.shade100,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: MyWidget().text(
                                    text: "PERSONAL INFORMATION",
                                    size: 18,
                                    fontWeight: FontWeight.bold,
                                    align: TextAlign.center,
                                    letterSpacing: 2,
                                    color: Colors.grey.shade400)),
                            SizedBox(height: size.height * .02),
                            Container(
                              width: size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      MyWidget().text(
                                          text: "Address : ",
                                          fontWeight: FontWeight.bold,
                                          size: 15),
                                      Expanded(
                                        child: MyWidget().text(
                                            text: docs.get("address") != null
                                                ? "${docs.get("address")}"
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
                                        text: "Sex : ",
                                        fontWeight: FontWeight.bold,
                                        size: 15,
                                      ),
                                      Expanded(
                                        child: MyWidget().text(
                                            text: docs.get("gender") != null
                                                ? "${docs.get("gender")}"
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
                                        text: "Date of Birth : ",
                                        fontWeight: FontWeight.bold,
                                        size: 15,
                                      ),
                                      Expanded(
                                        child: MyWidget().text(
                                            text: docs.get("birthday") != null
                                                ? "${docs.get("birthday")}"
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
                                        size: 15,
                                      ),
                                      Expanded(
                                        child: MyWidget().text(
                                            text: docs.get("email") != null
                                                ? "${docs.get("email")}"
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
                                        size: 15,
                                      ),
                                      Expanded(
                                        child: MyWidget().text(
                                            text: docs.get("religion") != null
                                                ? "${docs.get("religion")}"
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
                                        text: "Phone No. : ",
                                        fontWeight: FontWeight.bold,
                                        size: 15,
                                      ),
                                      Expanded(
                                        child: MyWidget().text(
                                            text: docs.get("phoneNumber") !=
                                                    null
                                                ? "${docs.get("phoneNumber")}"
                                                : "",
                                            size: 16,
                                            align: TextAlign.end),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(height: size.height * .04),
                            // Container(
                            //     width: size.width,
                            //     color: Colors.greenAccent.shade100,
                            //     padding:
                            //         const EdgeInsets.symmetric(vertical: 8),
                            //     child: MyWidget().text(
                            //         text: "PREVIOUS SCHOOL DATA",
                            //         size: 18,
                            //         fontWeight: FontWeight.bold,
                            //         align: TextAlign.center,
                            //         letterSpacing: 2,
                            //         color: Colors.grey.shade400)),
                            // SizedBox(height: size.height * .02),
                            // Container(
                            //   width: size.width,
                            //   margin:
                            //       const EdgeInsets.symmetric(horizontal: 20),
                            //   child: Column(
                            //     children: [
                            //       Row(
                            //         children: [
                            //           MyWidget().text(
                            //             text: "Elementary : ",
                            //             fontWeight: FontWeight.bold,
                            //             size: 15,
                            //           ),
                            //           Expanded(
                            //             child: MyWidget().text(
                            //                 text: "",
                            //                 size: 16,
                            //                 align: TextAlign.end),
                            //           )
                            //         ],
                            //       ),
                            //       const Divider(color: Colors.transparent),
                            //       Row(
                            //         children: [
                            //           MyWidget().text(
                            //             text: "Year Graduate : ",
                            //             fontWeight: FontWeight.bold,
                            //             size: 15,
                            //           ),
                            //           Expanded(
                            //             child: MyWidget().text(
                            //                 text: "",
                            //                 size: 16,
                            //                 align: TextAlign.end),
                            //           )
                            //         ],
                            //       ),
                            //       const Divider(
                            //         thickness: 2,
                            //       ),
                            //       Row(
                            //         children: [
                            //           MyWidget().text(
                            //             text: "Junior High : ",
                            //             fontWeight: FontWeight.bold,
                            //             size: 15,
                            //           ),
                            //           Expanded(
                            //             child: MyWidget().text(
                            //                 text: "",
                            //                 size: 16,
                            //                 align: TextAlign.end),
                            //           )
                            //         ],
                            //       ),
                            //       const Divider(color: Colors.transparent),
                            //       Row(
                            //         children: [
                            //           MyWidget().text(
                            //             text: "Year Graduate : ",
                            //             fontWeight: FontWeight.bold,
                            //             size: 15,
                            //           ),
                            //           Expanded(
                            //             child: MyWidget().text(
                            //                 text: "",
                            //                 size: 16,
                            //                 align: TextAlign.end),
                            //           )
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(height: size.height * .04),
                            Container(
                                width: size.width,
                                color: Colors.greenAccent.shade100,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: MyWidget().text(
                                    text: "PARENTS/GUARDIAN",
                                    size: 18,
                                    fontWeight: FontWeight.bold,
                                    align: TextAlign.center,
                                    letterSpacing: 2,
                                    color: Colors.grey.shade400)),
                            SizedBox(height: size.height * .02),
                            Container(
                              width: size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      MyWidget().text(
                                        text: "Father's Name : ",
                                        fontWeight: FontWeight.bold,
                                        size: 15,
                                      ),
                                      Expanded(
                                        child: MyWidget().text(
                                            text: docs.get("father") != null
                                                ? "${docs.get("father")}"
                                                : "",
                                            size: 16,
                                            align: TextAlign.end),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.transparent,
                                  ),
                                  Row(
                                    children: [
                                      MyWidget().text(
                                        text: "Father's Occupation : ",
                                        fontWeight: FontWeight.bold,
                                        size: 15,
                                      ),
                                      Expanded(
                                        child: MyWidget().text(
                                            text: docs.get(
                                                        "fatherOccupation") !=
                                                    null
                                                ? "${docs.get("fatherOccupation")}"
                                                : "",
                                            size: 16,
                                            align: TextAlign.end),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 2,
                                  ),
                                  Row(
                                    children: [
                                      MyWidget().text(
                                        text: "Mother's Name : ",
                                        fontWeight: FontWeight.bold,
                                        size: 15,
                                      ),
                                      Expanded(
                                        child: MyWidget().text(
                                            text: docs.get("mother") != null
                                                ? "${docs.get("mother")}"
                                                : "",
                                            size: 16,
                                            align: TextAlign.end),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.transparent,
                                  ),
                                  Row(
                                    children: [
                                      MyWidget().text(
                                        text: "Mother's Occupation : ",
                                        fontWeight: FontWeight.bold,
                                        size: 15,
                                      ),
                                      Expanded(
                                        child: MyWidget().text(
                                            text: docs.get(
                                                        "motherOccupation") !=
                                                    null
                                                ? "${docs.get("motherOccupation")}"
                                                : "",
                                            size: 16,
                                            align: TextAlign.end),
                                      )
                                    ],
                                  ),
                                  // const Divider(
                                  //   thickness: 2,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     MyWidget().text(
                                  //       text: "Guardian's Name : ",
                                  //       fontWeight: FontWeight.bold,
                                  //       size: 15,
                                  //     ),
                                  //     Expanded(
                                  //       child: MyWidget().text(
                                  //           text: "",
                                  //           size: 16,
                                  //           align: TextAlign.end),
                                  //     )
                                  //   ],
                                  // ),
                                  // const Divider(
                                  //   color: Colors.transparent,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     MyWidget().text(
                                  //       text: "Guardian's Address : ",
                                  //       fontWeight: FontWeight.bold,
                                  //       size: 15,
                                  //     ),
                                  //     Expanded(
                                  //       child: MyWidget().text(
                                  //           text: "",
                                  //           size: 16,
                                  //           align: TextAlign.end),
                                  //     )
                                  //   ],
                                  // ),
                                  // const Divider(
                                  //   color: Colors.transparent,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     MyWidget().text(
                                  //       text: "Guardian's Phone No. : ",
                                  //       fontWeight: FontWeight.bold,
                                  //       size: 15,
                                  //     ),
                                  //     Expanded(
                                  //       child: MyWidget().text(
                                  //           text: "",
                                  //           size: 16,
                                  //           align: TextAlign.end),
                                  //     )
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * .025),
                          ],
                        ))
                      ],
                    );
                  }
                  return MyWidget().loader();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
