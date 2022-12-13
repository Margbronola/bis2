// ignore_for_file: must_be_immutable

import 'package:bis/global/widget.dart';
import 'package:bis/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class AddStudentPage extends StatefulWidget {
  int? level;
  int grade;
  String? strand;
  AddStudentPage({super.key, this.level, required this.grade, this.strand});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  late final TextEditingController email;
  late final TextEditingController lname;
  late final TextEditingController fname;
  late final TextEditingController idnum;
  late final TextEditingController address;
  late final TextEditingController dob;
  late final TextEditingController religion;
  late final TextEditingController number;
  late final TextEditingController father;
  late final TextEditingController fOccupation;
  late final TextEditingController mother;
  late final TextEditingController mOccupation;
  bool isloading = false;
  String gender = "";
  String sectionvalue = '';
  String shsectionvalue = '';

  var g7section = ['Diamond', 'Ruby', 'Peridot', ''];
  var g8section = ['Emerald', 'Sapphire', 'Opal', 'Garnet', ''];
  var g9section = ['Quarts', 'Acquamarine', 'Pearl', 'Amber', ''];
  var g10section = ['Topaz', 'Cetrine', 'Silver', ''];
  var shsection = ['A', 'B', 'C', ''];

  @override
  void initState() {
    lname = TextEditingController();
    fname = TextEditingController();
    idnum = TextEditingController();
    address = TextEditingController();
    dob = TextEditingController();
    email = TextEditingController();
    religion = TextEditingController();
    number = TextEditingController();
    father = TextEditingController();
    fOccupation = TextEditingController();
    mother = TextEditingController();
    mOccupation = TextEditingController();
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
          "NEW STUDENT RECORD",
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
                    text: "PERSONAL INFORMATION",
                    size: 18,
                    fontWeight: FontWeight.bold,
                    align: TextAlign.center,
                    letterSpacing: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
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
                      widget.level == 12 || widget.level == 11
                          ? Row(
                              children: [
                                MyWidget().text(text: "Strand "),
                                Expanded(
                                  child: MyWidget().text(
                                      text: "${widget.strand}",
                                      align: TextAlign.end,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          : Container(),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          MyWidget().text(text: "Grade : "),
                          Expanded(
                            child: MyWidget().text(
                                text: "${widget.grade}",
                                align: TextAlign.end,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          MyWidget().text(text: "Section : "),
                          if (widget.level == 7) ...{
                            Expanded(
                              child: Container(
                                height: 48,
                                width: 110,
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerRight,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: DropdownButton(
                                  isExpanded: false,
                                  value: sectionvalue,
                                  elevation: 0,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade600),
                                  icon: Icon(
                                    Icons.expand_more_sharp,
                                    color: Colors.grey.shade600,
                                  ),
                                  items: g7section.map((String sec) {
                                    return DropdownMenuItem(
                                      value: sec,
                                      child: Text(sec),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      sectionvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          },
                          if (widget.level == 8) ...{
                            Expanded(
                              child: Container(
                                height: 48,
                                width: 110,
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerRight,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: DropdownButton(
                                  isExpanded: false,
                                  value: sectionvalue,
                                  elevation: 0,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade600),
                                  icon: Icon(
                                    Icons.expand_more_sharp,
                                    color: Colors.grey.shade600,
                                  ),
                                  items: g8section.map((String sec) {
                                    return DropdownMenuItem(
                                      value: sec,
                                      child: Text(sec),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      sectionvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          },
                          if (widget.level == 9) ...{
                            Expanded(
                              child: Container(
                                height: 48,
                                width: 110,
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerRight,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: DropdownButton(
                                  isExpanded: false,
                                  value: sectionvalue,
                                  elevation: 0,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade600),
                                  icon: Icon(
                                    Icons.expand_more_sharp,
                                    color: Colors.grey.shade600,
                                  ),
                                  items: g9section.map((String sec) {
                                    return DropdownMenuItem(
                                      value: sec,
                                      child: Text(sec),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      sectionvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          },
                          if (widget.level == 10) ...{
                            Expanded(
                              child: Container(
                                height: 48,
                                width: 110,
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerRight,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: DropdownButton(
                                  isExpanded: false,
                                  value: sectionvalue,
                                  elevation: 0,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade600),
                                  icon: Icon(
                                    Icons.expand_more_sharp,
                                    color: Colors.grey.shade600,
                                  ),
                                  items: g10section.map((String sec) {
                                    return DropdownMenuItem(
                                      value: sec,
                                      child: Text(sec),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      sectionvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          },
                          if (widget.level == 11 || widget.level == 12) ...{
                            Expanded(
                              child: Container(
                                height: 48,
                                width: 110,
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerRight,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: DropdownButton(
                                  isExpanded: false,
                                  value: shsectionvalue,
                                  elevation: 0,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade600),
                                  icon: Icon(
                                    Icons.expand_more_sharp,
                                    color: Colors.grey.shade600,
                                  ),
                                  items: shsection.map((String sec) {
                                    return DropdownMenuItem(
                                      value: sec,
                                      child: Text(sec),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      shsectionvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          },
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
                          MyWidget().text(text: "Address : "),
                          Expanded(
                              child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(left: 10),
                            child: MyWidget().textFormField2(
                                align: TextAlign.right, controller: address),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyWidget().text(text: "Sex : "),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: RadioListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: const Text("Male"),
                                    value: "male",
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 110,
                                  child: RadioListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: const Text("Female"),
                                    value: "female",
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  date = (await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100)))!;
                                  dob.text =
                                      DateFormat("yyyy-MM-dd").format(date);
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                align: TextAlign.right,
                                controller: fOccupation),
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
                                align: TextAlign.right,
                                controller: mOccupation),
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
                                  idnum.text.isEmpty) {
                                Fluttertoast.showToast(msg: "Fill all fields");
                                setState(() {
                                  isloading = false;
                                });
                              } else {
                                Authentication()
                                    .createStudent(
                                  email: email.text,
                                  password: idnum.text,
                                  type: "student",
                                  lname: lname.text,
                                  fname: fname.text,
                                  grade: "${widget.grade}",
                                  strand:
                                      widget.level == 12 || widget.level == 11
                                          ? "${widget.strand}"
                                          : null,
                                  section:
                                      widget.level == 12 || widget.level == 11
                                          ? shsectionvalue
                                          : sectionvalue,
                                  address: address.text,
                                  sex: gender,
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
