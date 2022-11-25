import 'package:bis/global/widget.dart';
import 'package:bis/services/adddata.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddGradePage extends StatefulWidget {
  String studId;
  dynamic data;
  AddGradePage({super.key, required this.data, required this.studId});

  @override
  State<AddGradePage> createState() => _AddGradePageState();
}

class _AddGradePageState extends State<AddGradePage> {
  late final TextEditingController sem;
  late final TextEditingController grade;
  String subject = "";
  bool isloading = false;
  String g12value = "Cookery NCII";
  String g11value = "Oral Communication";
  String jhvalue = "Mathematics";

  var g12sub = [
    'Introduction to Philosophy of Human Person/Pambungad sa Pilosopiya ng Tao',
    'Physical Education and Health',
    'Understanding Culture, Society & Politics',
    'English for Academics & Professional Purposes',
    'Filipino sa Piling Larang',
    'Practical Research 2',
    'Cookery NCII',
    'Media & Information Literacy',
    'Physical Science',
    'Inquiries, Investigation & Immersion',
    'Work Immersion',
  ];
  var g11sub = [
    'Oral Communication',
    'Empowerment Technology',
    'HouseKeeping',
    'Personal Development',
    '21st Century Literature',
    'General Mathematica',
    'Earth & Life Science',
    'P.E',
    'Komunikasyon at Pananaliksik'
  ];
  var jh = [
    'English',
    'Mathematics',
    'Filipino',
    'Science',
    'T.L.E',
    'ESP',
    'Araling Panlipunan',
    'Music',
    'Arts',
    'P.E',
    'Health'
  ];

  @override
  void initState() {
    sem = TextEditingController();
    grade = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    sem.dispose();
    grade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.greenAccent.shade100,
        foregroundColor: Colors.black,
        title: const Text(
          "ADD GRADE",
          style: TextStyle(letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    MyWidget().text(text: "Quarter : ", size: 18),
                    Expanded(
                        child: Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 10),
                      child: MyWidget().textFormField2(
                          align: TextAlign.right,
                          controller: sem,
                          keyboardType: TextInputType.phone),
                    )),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    MyWidget().text(text: "Grade & Section : ", size: 18),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(left: 10),
                      child: MyWidget().text(
                          fontWeight: FontWeight.bold,
                          text:
                              "${widget.data['grade']} ${widget.data['section']}",
                          size: 20),
                    )),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    MyWidget().text(text: "Name : ", size: 18),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(left: 10),
                      child: MyWidget().text(
                          fontWeight: FontWeight.bold,
                          text:
                              "${widget.data['lastname']}, ${widget.data['firstname']}",
                          size: 20),
                    )),
                  ],
                ),
                const SizedBox(height: 40),
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
                const SizedBox(height: 40),
                SizedBox(
                  width: size.width,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: const Text(
                              "SUBJECT",
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )),
                          const VerticalDivider(
                            color: Colors.grey,
                            thickness: 5,
                          ),
                          Container(
                            width: 80,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: const Text(
                              "GRADE",
                              style: TextStyle(
                                  letterSpacing: 1.5,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          if ("${widget.data['grade']}" == "12") ...{
                            Expanded(
                              child: Container(
                                height: 80,
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(bottom: 10),
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Colors.grey.shade100),
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: g12value,
                                  elevation: 0,
                                  itemHeight: 90,
                                  underline:
                                      Container(color: Colors.transparent),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade600),
                                  icon: Icon(
                                    Icons.expand_more_sharp,
                                    color: Colors.grey.shade600,
                                  ),
                                  items: g12sub.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Container(
                                          width: 200,
                                          margin: const EdgeInsets.all(5),
                                          child: Expanded(child: Text(items))),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      g12value = newValue!;
                                      subject = newValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                          },
                          if ("${widget.data['grade']}" == "11") ...{
                            Expanded(
                              child: Container(
                                height: 80,
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(bottom: 10),
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Colors.grey.shade100),
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: g11value,
                                  elevation: 0,
                                  itemHeight: 90,
                                  underline:
                                      Container(color: Colors.transparent),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade600),
                                  icon: Icon(
                                    Icons.expand_more_sharp,
                                    color: Colors.grey.shade600,
                                  ),
                                  items: g11sub.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Container(
                                          width: 200,
                                          margin: const EdgeInsets.all(5),
                                          child: Expanded(child: Text(items))),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      g11value = newValue!;
                                      subject = newValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                          },
                          if ("${widget.data['grade']}" == "7" ||
                              "${widget.data['grade']}" == "8" ||
                              "${widget.data['grade']}" == "9" ||
                              "${widget.data['grade']}" == "10") ...{
                            Expanded(
                              child: Container(
                                height: 80,
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(bottom: 10),
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Colors.grey.shade100),
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: jhvalue,
                                  elevation: 0,
                                  itemHeight: 90,
                                  underline:
                                      Container(color: Colors.transparent),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade600),
                                  icon: Icon(
                                    Icons.expand_more_sharp,
                                    color: Colors.grey.shade600,
                                  ),
                                  items: jh.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Container(
                                          width: 200,
                                          margin: const EdgeInsets.all(5),
                                          child: Expanded(child: Text(items))),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      jhvalue = newValue!;
                                      subject = newValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                          },
                          Container(
                            width: 80,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            alignment: Alignment.center,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: grade,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
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
                            if (sem.text.isEmpty) {
                              Fluttertoast.showToast(msg: "Fill all fields");
                              setState(() {
                                isloading = false;
                              });
                            } else {
                              AddData()
                                  .addGrade(widget.studId, sem.text, subject,
                                      grade.text)
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
              ],
            ),
          ),
          isloading ? MyWidget().loader() : Container(),
        ],
      ),
    );
  }
}
