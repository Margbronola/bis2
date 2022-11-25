import 'package:bis/global/widget.dart';
import 'package:bis/insdashboard.dart';
import 'package:bis/services/auth.dart';
import 'package:bis/studdashboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final Authentication _auth = Authentication();
  bool isObscure = false;
  bool isLoading = false;
  String label = "";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                width: size.width,
                height: size.height,
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 130),
                      Image.asset(
                        'assets/images/school_logo.jpeg',
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        height: size.height * .05,
                      ),
                      Container(
                        height: 55,
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: const EdgeInsets.only(left: 20),
                            hintText: "Email",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .003,
                      ),
                      Container(
                        height: 55,
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: password,
                          obscureText: isObscure ? false : true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: const EdgeInsets.only(left: 20),
                            hintText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: Icon(
                                isObscure == false
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                color: Colors.greenAccent.shade100,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 150,
                            child: RadioListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text("Student"),
                              activeColor: Colors.green,
                              value: "Student",
                              groupValue: label,
                              onChanged: (value) {
                                setState(() {
                                  label = value.toString();
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: RadioListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text("Instructor"),
                              activeColor: Colors.green,
                              value: "Instructor",
                              groupValue: label,
                              onChanged: (value) {
                                setState(() {
                                  label = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .04,
                      ),
                      Container(
                        height: 55,
                        width: size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.greenAccent.shade200),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                letterSpacing: 2,
                                color: Colors.black45,
                                fontSize: 20),
                          ),
                          onPressed: () async {
                            if (email.text.isNotEmpty &&
                                password.text.isNotEmpty &&
                                label != "") {
                              await _auth
                                  .signIn(
                                      email: email.text,
                                      password: password.text,
                                      page: label)
                                  .then((value) {
                                if (value != null) {
                                  if (label == "Student") {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                        child: const StudDashboardPage(),
                                        type: PageTransitionType.bottomToTop,
                                      ),
                                    );
                                  } else {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                        child: const InstructorDashboardPage(),
                                        type: PageTransitionType.bottomToTop,
                                      ),
                                    );
                                  }
                                }
                              });
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please fill the empty fields");
                              // "Access denied! Incorrect email/password"
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            isLoading ? MyWidget().loader() : Container()
          ],
        ),
      ),
    );
  }
}
