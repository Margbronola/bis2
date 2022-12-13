import 'package:bis/global/widget.dart';
import 'package:bis/services/update.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class EditDataPage extends StatefulWidget {
  String uid;
  dynamic data;
  String level;
  EditDataPage(
      {super.key, required this.data, required this.level, required this.uid});

  @override
  State<EditDataPage> createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  late final TextEditingController email = TextEditingController();
  late final TextEditingController lname = TextEditingController();
  late final TextEditingController fname = TextEditingController();
  late final TextEditingController idnum = TextEditingController();
  late final TextEditingController address = TextEditingController();
  late final TextEditingController dob = TextEditingController();
  late final TextEditingController religion = TextEditingController();
  late final TextEditingController number = TextEditingController();
  late final TextEditingController father = TextEditingController();
  late final TextEditingController fOccupation = TextEditingController();
  late final TextEditingController mother = TextEditingController();
  late final TextEditingController mOccupation = TextEditingController();
  bool isloading = false;
  String sectionvalue = '';
  String shsectionvalue = '';

  var g7section = ['Diamond', 'Ruby', 'Peridot', ''];
  var g8section = ['Emerald', 'Sapphire', 'Opal', 'Garnet', ''];
  var g9section = ['Quarts', 'Acquamarine', 'Pearl', 'Amber', ''];
  var g10section = ['Topaz', 'Cetrine', 'Silver', ''];
  var shsection = ['A', 'B', 'C', ''];

  @override
  void initState() {
    lname.text = "${widget.data['lastname'] ?? ""}";
    fname.text = "${widget.data['firstname'] ?? ""}";
    idnum.text = "${widget.data['lrn'] ?? ""}";
    address.text = "${widget.data['address'] ?? ""}";
    dob.text = "${widget.data['birthday'] ?? ""}";
    email.text = "${widget.data['email'] ?? ""}";
    religion.text = "${widget.data['religion'] ?? ""}";
    number.text = "${widget.data['phoneNumber'] ?? ""}";
    father.text = "${widget.data['father'] ?? ""}";
    fOccupation.text = "${widget.data['fatherOccupation'] ?? ""}";
    mother.text = "${widget.data['mother'] ?? ""}";
    mOccupation.text = "${widget.data['motherOccupation'] ?? ""}";
    super.initState();
  }

  @override
  void dispose() {
    lname.dispose();
    fname.dispose();
    idnum.dispose();
    address.dispose();
    dob.dispose();
    email.dispose();
    religion.dispose();
    number.dispose();
    father.dispose();
    fOccupation.dispose();
    mother.dispose();
    mOccupation.dispose();
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
                            align: TextAlign.right, controller: lname),
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
                            align: TextAlign.right, controller: fname),
                      )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      MyWidget().text(text: "LRN : "),
                      Expanded(
                          child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 10),
                        child: MyWidget().textFormField2(
                            align: TextAlign.right, controller: idnum),
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
                      MyWidget().text(text: "Grade : "),
                      Expanded(
                        child: MyWidget().text(
                            text: "${widget.data['grade']}",
                            align: TextAlign.end,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  widget.level == "12" || widget.level == "11"
                      ? Row(
                          children: [
                            MyWidget().text(text: "Strand "),
                            Expanded(
                              child: MyWidget().text(
                                  text: "${widget.data['strand']}",
                                  align: TextAlign.end,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      MyWidget().text(text: "Section "),
                      Expanded(
                        child: MyWidget().text(
                            text: "${widget.data['section']}",
                            align: TextAlign.end,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // : Container(),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      MyWidget().text(text: "Gender "),
                      Expanded(
                        child: MyWidget().text(
                            text: "${widget.data['gender']}",
                            align: TextAlign.end,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      MyWidget().text(text: "Address : "),
                      Expanded(
                          child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 10),
                        child: MyWidget().textFormField2(
                            align: TextAlign.right,
                            controller: address,
                            keyboardType: TextInputType.text),
                      )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      MyWidget().text(text: "Date of Birth : "),
                      Expanded(
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            textAlign: TextAlign.right,
                            controller: dob,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 7),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            onTap: () async {
                              DateTime date = DateTime(1900);
                              FocusScope.of(context).requestFocus(FocusNode());
                              date = (await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100)))!;
                              dob.text = DateFormat("yyyy-MM-dd").format(date);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      MyWidget().text(text: "Religion : "),
                      Expanded(
                          child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 10),
                        child: MyWidget().textFormField2(
                            align: TextAlign.right, controller: religion),
                      )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      MyWidget().text(text: "Phone No. : "),
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
                      MyWidget().text(text: "Father : "),
                      Expanded(
                          child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 10),
                        child: MyWidget().textFormField2(
                            align: TextAlign.right, controller: father),
                      )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      MyWidget().text(text: "Father Occupation : "),
                      Expanded(
                          child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 10),
                        child: MyWidget().textFormField2(
                            align: TextAlign.right, controller: fOccupation),
                      )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      MyWidget().text(text: "Mother : "),
                      Expanded(
                          child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 10),
                        child: MyWidget().textFormField2(
                            align: TextAlign.right, controller: mother),
                      )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      MyWidget().text(text: "Mother Occupation : "),
                      Expanded(
                          child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 10),
                        child: MyWidget().textFormField2(
                            align: TextAlign.right, controller: mOccupation),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                              idnum.text.isEmpty) {
                            Fluttertoast.showToast(msg: "Fill all fields");
                            setState(() {
                              isloading = false;
                            });
                          } else {
                            UpdateData()
                                .updateStudent(
                              uid: widget.uid,
                              email: email.text,
                              password: idnum.text,
                              type: "student",
                              lname: lname.text,
                              fname: fname.text,
                              grade: "${widget.data['grade']}",
                              strand:
                                  widget.level == "12" || widget.level == "11"
                                      ? "${widget.data['strand']}"
                                      : null,
                              section: "${widget.data['section']}",
                              address: address.text,
                              sex: widget.data['gender'],
                              dob: dob.text,
                              religion: religion.text,
                              number: number.text,
                              father: father.text,
                              fOccupation: fOccupation.text,
                              mother: mother.text,
                              mOccupation: mOccupation.text,
                            )
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
            )
          ],
        ),
      ),
    );
  }
}
