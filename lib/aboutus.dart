import 'package:bis/global/widget.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("ABOUT US", style: TextStyle(letterSpacing: 1)),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ListView(
          children: [
            MyWidget().text(
                text: "BAGACAY INTEGRATED SCHOOL",
                fontWeight: FontWeight.bold,
                size: 18,
                align: TextAlign.center,
                letterSpacing: 1.5),
            MyWidget().text(
                text: "Brgy. Bagacay, Calbayog City",
                align: TextAlign.center,
                letterSpacing: 1.5),
            const Divider(color: Colors.transparent),
            MyWidget().text(
              size: 16,
              text: "SCHOOL ID: 500807",
              fontWeight: FontWeight.bold,
              align: TextAlign.center,
              letterSpacing: 1.5,
            ),
            const Divider(color: Colors.transparent),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  MyWidget().text(
                    text: "VISSION",
                    fontWeight: FontWeight.bold,
                    size: 18,
                    align: TextAlign.center,
                    letterSpacing: 2,
                  ),
                  const Divider(color: Colors.transparent),
                  MyWidget().text(
                    text:
                        "We dream of Filipinos who passionately love their country and whose values and competencies enable them to realize their full potential and contribute meaningfully to building the nation.\nAs a learner-centered public institution, the Department of Education continuously improves itself to better serve its stakeholders.",
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.transparent),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  MyWidget().text(
                    text: "MISSION",
                    fontWeight: FontWeight.bold,
                    size: 18,
                    align: TextAlign.center,
                    letterSpacing: 2,
                  ),
                  const Divider(color: Colors.transparent),
                  MyWidget().text(
                    text:
                        "To protect and promote the right of every Filipino to quality, equitable, culture-based, and complete basic education where:\nStudents learn in a child-friendly, gender-sensitive, safe, and motivating environment.\nTeachers facilitate learning and constantly nurture every learner.\nAdministrators and Staff, as stewards of the institution ensure an enabling and supportive environment for effective learning to happen.\nFamily, community, and other stakeholders are actively engaged and share responsibility for developing life-long learners.",
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
