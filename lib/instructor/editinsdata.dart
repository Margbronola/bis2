import 'package:bis/global/widget.dart';
import 'package:bis/services/update.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditInstructorDataPage extends StatefulWidget {
  String uid;
  dynamic data;
  String? level;
  EditInstructorDataPage(
      {super.key, required this.data, this.level, required this.uid});

  @override
  State<EditInstructorDataPage> createState() => _EditInstructorDataPageState();
}

class _EditInstructorDataPageState extends State<EditInstructorDataPage> {
  late final TextEditingController email = TextEditingController();
  late final TextEditingController lname = TextEditingController();
  late final TextEditingController fname = TextEditingController();
  late final TextEditingController number = TextEditingController();
  late final TextEditingController grade = TextEditingController();
  late final TextEditingController strand = TextEditingController();
  late final TextEditingController section = TextEditingController();
  bool isloading = false;

  @override
  void initState() {
    email.text = "${widget.data['email'] ?? ""}";
    lname.text = "${widget.data['lastname'] ?? ""}";
    fname.text = "${widget.data['firstname'] ?? ""}";
    number.text = "${widget.data['cellphone'] ?? ""}";
    grade.text = "${widget.data['grade'] ?? ""}";
    strand.text = "${widget.data['strand'] ?? ""}";
    section.text = "${widget.data['section'] ?? ""}";
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    lname.dispose();
    fname.dispose();
    number.dispose();
    grade.dispose();
    section.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade100,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "EDIT DATA",
          style: TextStyle(letterSpacing: 2),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MyWidget().text(text: "Last Name : "),
                          Expanded(
                              child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(left: 10),
                            child: MyWidget().textFormField2(
                              align: TextAlign.right,
                              controller: lname,
                              capitalization: TextCapitalization.words,
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          MyWidget().text(text: "First Name : "),
                          Expanded(
                              child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(left: 10),
                            child: MyWidget().textFormField2(
                              align: TextAlign.right,
                              controller: fname,
                              capitalization: TextCapitalization.words,
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          MyWidget().text(text: "Email : "),
                          Expanded(
                              child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(left: 10),
                            child: MyWidget().textFormField2(
                                align: TextAlign.right,
                                controller: email,
                                keyboardType: TextInputType.emailAddress),
                          )),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          MyWidget().text(text: "Phone Number : "),
                          Expanded(
                              child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(left: 10),
                            child: MyWidget().textFormField2(
                                align: TextAlign.right,
                                controller: number,
                                keyboardType: TextInputType.phone),
                          )),
                        ],
                      ),
                      const SizedBox(height: 20),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyWidget().text(text: "Strand : "),
                          Expanded(
                              child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(left: 10),
                            child: MyWidget().textFormField2(
                              align: TextAlign.right,
                              controller: strand,
                              keyboardType: TextInputType.text,
                              capitalization: TextCapitalization.characters,
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          MyWidget().text(text: "Grade : "),
                          Expanded(
                              child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(left: 10),
                            child: MyWidget().textFormField2(
                                align: TextAlign.right,
                                controller: grade,
                                keyboardType: TextInputType.phone),
                          )),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          MyWidget().text(text: "Section : "),
                          Expanded(
                              child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(left: 10),
                            child: MyWidget().textFormField2(
                              align: TextAlign.right,
                              controller: section,
                              keyboardType: TextInputType.text,
                              capitalization: TextCapitalization.words,
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        width: size.width,
                        margin: const EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isloading = true;
                              });
                              if (lname.text.isEmpty ||
                                  fname.text.isEmpty ||
                                  email.text.isEmpty ||
                                  number.text.isEmpty) {
                                Fluttertoast.showToast(msg: "Fill all fields");
                                setState(() {
                                  isloading = false;
                                });
                              } else {
                                UpdateData()
                                    .updateInstructor(
                                        uid: widget.uid,
                                        email: email.text,
                                        fname: fname.text,
                                        lname: lname.text,
                                        grade: grade.text,
                                        section: section.text,
                                        strand: strand.text,
                                        number: number.text)
                                    .whenComplete(() {
                                  setState(() {
                                    isloading = false;
                                  });
                                  Navigator.of(context).pop();
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent.shade200,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: MyWidget().text1(
                                label: "SAVE",
                                letterSpacing: 2,
                                weight: FontWeight.bold,
                                color: Colors.grey.shade700)),
                      ),
                      Container(
                        height: 55,
                        width: size.width,
                        margin: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade300,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: MyWidget().text1(
                                label: "CANCEL",
                                letterSpacing: 2,
                                weight: FontWeight.bold,
                                color: Colors.grey.shade700)),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          isloading ? MyWidget().loader() : Container()
        ],
      ),
    );
  }
}
