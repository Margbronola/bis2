// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateData {
  CollectionReference student =
      FirebaseFirestore.instance.collection('Student');
  CollectionReference instructor =
      FirebaseFirestore.instance.collection('Instructor');
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> updateStudent({
    uid,
    required String email,
    required String password,
    required String type,
    required String fname,
    required String lname,
    required String grade,
    String? strand,
    required String section,
    required String address,
    required String sex,
    required String dob,
    required String religion,
    required String number,
    String? father,
    String? fOccupation,
    String? mother,
    String? mOccupation,
  }) async {
    return await student
        .doc(uid)
        .update({
          "email": email,
          "firstname": fname,
          "lastname": lname,
          "lrn": password,
          "strand": strand,
          "grade": grade,
          "section": section,
          "address": address,
          "gender": sex,
          "birthday": dob,
          "religion": religion,
          "phoneNumber": number,
          "father": father,
          "fatherOccupation": fOccupation,
          "mother": mother,
          "motherOccupation": mOccupation,
        })
        .then((value) => print("data Added"))
        .catchError((error) => print("data couldn't be added."));
  }

  Future<void> updateInstructor({
    uid,
    required String email,
    required String fname,
    required String lname,
    required String grade,
    String? strand,
    required String section,
    required String number,
  }) async {
    return await instructor
        .doc(uid)
        .update({
          "email": email,
          "firstname": fname,
          "lastname": lname,
          "strand": strand,
          "grade": grade,
          "section": section,
          "cellphone": number,
        })
        .then((value) => print("data Added"))
        .catchError((error) => print("data couldn't be added."));
  }
}
