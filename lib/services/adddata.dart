// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class AddData {
  Future<String?> addGrade(
    String studId,
    String sem,
    String subject,
    String grades,
  ) async {
    CollectionReference grade = FirebaseFirestore.instance
        .collection('Student')
        .doc(studId)
        .collection('Grade');
    await grade
        .add({
          "sem": sem,
          "subject": subject,
          "grade": grades,
        })
        .then((value) => print("data Added"))
        .catchError((error) => print("data couldn't be added."));

    return grade.id;
  }

  Future<void> addAchieverSH(
    String grade,
    String strand,
    String section,
    String quarter,
    String name,
    String award,
    String average,
  ) async {
    CollectionReference achiever =
        FirebaseFirestore.instance.collection('Achiever');
    return await achiever
        .add({
          "grade": grade,
          "strand": strand,
          "section": section,
          "quarter": quarter,
          "name": name,
          "average": average,
          "award": award,
        })
        .then((value) => print("data Added"))
        .catchError((error) => print("data couldn't be added."));
  }

  Future<void> addAchieverJH(
    String grade,
    String section,
    String quarter,
    String name,
    String award,
    String average,
  ) async {
    CollectionReference achiever =
        FirebaseFirestore.instance.collection('Achiever');
    return await achiever
        .add({
          "grade": grade,
          "section": section,
          "quarter": quarter,
          "name": name,
          "average": average,
          "award": award,
        })
        .then((value) => print("data Added"))
        .catchError((error) => print("data couldn't be added."));
  }
}
