// ignore_for_file: avoid_print

import 'package:bis/global/container.dart';
import 'package:bis/global/datacacher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

class Authentication {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  final DataCacher cacher = DataCacher.instance;
  CollectionReference student =
      FirebaseFirestore.instance.collection('Student');
  CollectionReference instructor =
      FirebaseFirestore.instance.collection('Instructor');

  Future<String?> create({
    required String email,
    required String password,
    required String type,
    required String fname,
    required String lname,
    required String grade,
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
    try {
      UserCredential creds = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (creds.user == null) return null;
      cacher.token = "${creds.user!.getIdToken()}";
      // cacher.uid = creds.user!.uid;
      cacher.pages = page;
      uid = creds.user!.uid;
      if (type == "instructor") {
        instructor.doc(creds.user!.uid).set({
          "email": email,
          "firstname": fname,
          "lastname": lname,
          "address": null,
          "map": null,
          "Telephone": null,
          "image": null,
        });
        return await creds.user!.getIdToken();
      } else {
        student.doc(creds.user!.uid).set({
          "email": email,
          "firstname": fname,
          "lastname": lname,
          "lrn": password,
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
        });
        print("DATA: ${creds.user!.getIdToken()}");
        return await creds.user!.getIdToken();
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> signIn(
      {required String email,
      required String password,
      required String page}) async {
    try {
      final AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      final UserCredential authResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (authResult.user == null) return null;
      cacher.token = "${authResult.user!.getIdToken()}";
      cacher.pages = page;
      cacher.uid = authResult.user!.uid;
      uid = authResult.user!.uid;
      page = page;
      return authResult.user!.getIdToken();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "Account not found");
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Incorrect password");
      } else if (e.code == "") {}
      return null;
    }
  }

  Future<void> signout() async {
    try {
      FirebaseAuth.instance.signOut();
    } catch (e) {
      return;
    }
  }
}
