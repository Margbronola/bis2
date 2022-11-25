import 'package:bis/global/widget.dart';
import 'package:bis/services/adddata.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddAchieverPage extends StatefulWidget {
  const AddAchieverPage({super.key});

  @override
  State<AddAchieverPage> createState() => _AddAchieverPageState();
}

class _AddAchieverPageState extends State<AddAchieverPage> {
  TextEditingController sem = TextEditingController();
  TextEditingController grade = TextEditingController();
  TextEditingController strand = TextEditingController();
  TextEditingController section = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController award = TextEditingController();
  TextEditingController average = TextEditingController();
  bool isloading = false;
  String dropdownvalue = "GAS";

  var strands = ['GAS', 'TVL'];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.greenAccent.shade100,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                MyWidget().text(text: "Grade : ", size: 18),
                Expanded(
                    child: Container(
                  height: 35,
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
                MyWidget().text(text: "Strand : ", size: 18),
                Expanded(
                  child: Container(
                    height: 48,
                    width: 110,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerRight,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: DropdownButton(
                      isExpanded: false,
                      value: dropdownvalue,
                      elevation: 0,
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade600),
                      icon: Icon(
                        Icons.expand_more_sharp,
                        color: Colors.grey.shade600,
                      ),
                      items: strands.map((String strands) {
                        return DropdownMenuItem(
                          value: strands,
                          child: Text(strands),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                MyWidget().text(text: "Section : ", size: 18),
                Expanded(
                  child: Container(
                    height: 35,
                    padding: const EdgeInsets.only(left: 10),
                    child: MyWidget().textFormField2(
                      align: TextAlign.right,
                      controller: section,
                      capitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                MyWidget().text(text: "Quarter : ", size: 18),
                Expanded(
                    child: Container(
                  height: 35,
                  padding: const EdgeInsets.only(left: 10),
                  child: MyWidget().textFormField2(
                      align: TextAlign.right,
                      controller: sem,
                      keyboardType: TextInputType.phone),
                )),
              ],
            ),
            const SizedBox(height: 50),
            MyWidget().text(
                text: "ACHIEVER",
                letterSpacing: 2,
                align: TextAlign.center,
                size: 25,
                fontWeight: FontWeight.bold),
            const SizedBox(height: 20),
            Row(
              children: [
                MyWidget().text(text: "Name : ", size: 18),
                Expanded(
                    child: Container(
                  height: 35,
                  padding: const EdgeInsets.only(left: 10),
                  child: MyWidget().textFormField2(
                      align: TextAlign.right,
                      controller: name,
                      capitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text),
                )),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                MyWidget().text(text: "Award : ", size: 18),
                Expanded(
                    child: Container(
                  height: 35,
                  padding: const EdgeInsets.only(left: 10),
                  child: MyWidget().textFormField2(
                      align: TextAlign.right,
                      controller: award,
                      keyboardType: TextInputType.text),
                )),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                MyWidget().text(text: "Average : ", size: 18),
                Expanded(
                    child: Container(
                  height: 35,
                  padding: const EdgeInsets.only(left: 10),
                  child: MyWidget().textFormField2(
                      align: TextAlign.right,
                      controller: average,
                      keyboardType: TextInputType.phone),
                )),
              ],
            ),
            const SizedBox(height: 30),
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
                        if (sem.text.isEmpty ||
                            grade.text.isEmpty ||
                            section.text.isEmpty ||
                            name.text.isEmpty ||
                            award.text.isEmpty ||
                            average.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Fill all fields");
                          setState(() {
                            isloading = false;
                          });
                        } else {
                          if (grade.text == "11" || grade.text == "12") {
                            AddData()
                                .addAchieverSH(
                                    grade.text,
                                    dropdownvalue,
                                    section.text,
                                    sem.text,
                                    name.text,
                                    award.text,
                                    average.text)
                                .whenComplete(() {
                              setState(() {
                                isloading = false;
                              });
                              Navigator.of(context).pop();
                            });
                          } else {
                            AddData()
                                .addAchieverJH(
                                    grade.text,
                                    section.text,
                                    sem.text,
                                    name.text,
                                    award.text,
                                    average.text)
                                .whenComplete(() {
                              setState(() {
                                isloading = false;
                              });
                              Navigator.of(context).pop();
                            });
                          }
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
    );
  }
}
