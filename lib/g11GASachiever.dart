import 'package:bis/global/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Grade11GASAchieverPage extends StatefulWidget {
  const Grade11GASAchieverPage({super.key});

  @override
  State<Grade11GASAchieverPage> createState() => _Grade11GASAchieverPageState();
}

class _Grade11GASAchieverPageState extends State<Grade11GASAchieverPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("GRADE 11", style: TextStyle(letterSpacing: 1)),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyWidget().text(
              text: "GAS A".toUpperCase(),
              fontWeight: FontWeight.bold,
              size: 20,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Achiever")
                  .where("grade", isEqualTo: "11")
                  .where("strand", isEqualTo: "GAS")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && !snapshot.hasError) {
                  final result = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemCount: result.size,
                    itemBuilder: (_, i) {
                      final achiever = result.docs[i];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            width: size.width,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyWidget().text(
                                  text: (achiever.get("name") != null
                                          ? "${achiever.get("name")}"
                                          : "")
                                      .toUpperCase(),
                                  fontWeight: FontWeight.bold,
                                  size: 20,
                                ),
                                const SizedBox(height: 7),
                                MyWidget().text(
                                  text: achiever.get("award") != null
                                      ? "${achiever.get("award")}"
                                      : "",
                                  align: TextAlign.center,
                                  color: Colors.grey.shade800,
                                  size: 18,
                                ),
                                MyWidget().text(
                                  text:
                                      "General Average: ${achiever.get("average") != null ? "${achiever.get("average")}" : ""}",
                                  align: TextAlign.center,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
                return MyWidget().loader();
              },
            ),
          ],
        ),
      ),
    );
  }
}
