// ignore_for_file: avoid_print

import 'package:bis/global/container.dart';
import 'package:bis/global/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InsProfilePage extends StatefulWidget {
  const InsProfilePage({super.key});

  @override
  State<InsProfilePage> createState() => _InsProfilePageState();
}

class _InsProfilePageState extends State<InsProfilePage> {
  late final TextEditingController password;
  bool visiblewidget = false;
  bool visiblecontainer = true;
  bool isloading = false;

  @override
  void initState() {
    password = TextEditingController();
  }

  @override
  void dispose() {
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "PROFILE",
          style: TextStyle(letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Instructor")
                  .doc(uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && !snapshot.hasError) {
                  final ins = snapshot.data!;
                  print("DATA: $ins");
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Name :",
                                    style: TextStyle(fontSize: 20)),
                                MyWidget().text(
                                  text:
                                      "${ins.get("lastname") != null ? "${ins.get("lastname")}" : ""}, ${ins.get("firstname") != null ? "${ins.get("firstname")}" : ""}"
                                          .toUpperCase(),
                                  align: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                  size: 18,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Email :",
                                    style: TextStyle(fontSize: 20)),
                                MyWidget().text(
                                  text: ins.get("email") != null
                                      ? "${ins.get("email")}"
                                      : "",
                                  align: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                  size: 18,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Phone Number :",
                                    style: TextStyle(fontSize: 20)),
                                MyWidget().text(
                                  text: ins.get("cellphone") != null
                                      ? "${ins.get("cellphone")}"
                                      : "",
                                  align: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                  size: 18,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width,
                        color: Colors.greenAccent.shade100,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: MyWidget().text(
                          text: "ADVISORY CLASS",
                          size: 20,
                          fontWeight: FontWeight.bold,
                          align: TextAlign.center,
                          letterSpacing: 2,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                MyWidget().text(
                                    text: "Strand : ",
                                    fontWeight: FontWeight.bold,
                                    size: 20),
                                Expanded(
                                  child: MyWidget().text(
                                      text: ins.get("strand") != null
                                          ? "${ins.get("strand")}"
                                          : "",
                                      size: 20,
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
                                    size: 20),
                                Expanded(
                                  child: MyWidget().text(
                                      text: ins.get("grade") != null
                                          ? "${ins.get("grade")}"
                                          : "",
                                      size: 20,
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
                                    size: 20),
                                Expanded(
                                  child: MyWidget().text(
                                      text: ins.get("section") != null
                                          ? "${ins.get("section")}"
                                          : "",
                                      size: 20,
                                      align: TextAlign.end),
                                )
                              ],
                            ),
                            const Divider(),
                          ],
                        ),
                      )
                    ],
                  );
                }
                return MyWidget().loader();
              },
            ),
            // Visibility(
            //   visible: visiblecontainer,
            //   replacement: Container(
            //     width: size.width,
            //     padding: const EdgeInsets.symmetric(vertical: 10),
            //     child: Column(
            //       children: [
            //         MyWidget().text(
            //             text: "CHANGE PASSWORD",
            //             align: TextAlign.center,
            //             fontWeight: FontWeight.bold,
            //             size: 18,
            //             letterSpacing: 1.5),
            //         const SizedBox(height: 20),
            //         Row(
            //           children: [
            //             const Text("New Password: "),
            //             Expanded(
            //                 child: Container(
            //               height: 40,
            //               padding: const EdgeInsets.only(left: 10),
            //               child: MyWidget().textFormField2(
            //                   align: TextAlign.right, controller: password),
            //             )),
            //           ],
            //         ),
            //         Container(
            //           height: 55,
            //           width: size.width,
            //           margin: const EdgeInsets.only(top: 30),
            //           child: ElevatedButton(
            //             onPressed: () async {
            //               setState(() {
            //                 isloading = true;
            //               });
            //             },
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.greenAccent.shade200,
            //               shadowColor: Colors.transparent,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //             ),
            //             child: MyWidget().text1(
            //               label: "SAVE",
            //               letterSpacing: 2,
            //               weight: FontWeight.bold,
            //               color: Colors.grey.shade700,
            //             ),
            //           ),
            //         ),
            //         Container(
            //           height: 55,
            //           width: size.width,
            //           margin: const EdgeInsets.only(top: 10),
            //           child: ElevatedButton(
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //               style: ElevatedButton.styleFrom(
            //                 backgroundColor: Colors.red.shade300,
            //                 shadowColor: Colors.transparent,
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //               ),
            //               child: MyWidget().text1(
            //                   label: "CANCEL",
            //                   letterSpacing: 2,
            //                   weight: FontWeight.bold,
            //                   color: Colors.grey.shade700)),
            //         )
            //       ],
            //     ),
            //   ),
            //   child: Container(
            //     height: 55,
            //     width: size.width,
            //     decoration: BoxDecoration(
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.2),
            //           spreadRadius: 3,
            //           blurRadius: 10,
            //           offset: const Offset(0, 0),
            //         ),
            //       ],
            //     ),
            //     child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(30),
            //           ),
            //           backgroundColor: Colors.greenAccent.shade200),
            //       child: const Text(
            //         "Change Password",
            //         style: TextStyle(
            //             letterSpacing: 2, color: Colors.black45, fontSize: 18),
            //       ),
            //       onPressed: () {
            //         setState(() {
            //           visiblewidget = !visiblewidget;
            //           visiblecontainer = !visiblecontainer;
            //         });
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
