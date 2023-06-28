import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseServices {
  final docUser = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser?.email);

  Future createUser(
    String name,
    String affiliation,
    String exp,
    String fieldStudy,
  ) async {
    final json = {
      'name': name,
      'affiliation': affiliation,
      'numbers of capsules read': fieldStudy,
      'experience in this field': exp,
    };

    await docUser.set(json);
  }

  Future updateInfo({
    required String name,
    required String affiliation,
    required String exp,
    required String fieldStudy,
    required BuildContext context,
  }) async {
    try {
      await docUser.update(
        {
          'name': name,
          'affiliation': affiliation,
          'numbers of capsules read': fieldStudy,
          'experience in this field': exp,
        },
      );
      Fluttertoast.showToast(
          msg: "Information updated", gravity: ToastGravity.BOTTOM);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
      Navigator.of(context).pop();
    }
  }

  Future storeTime({required String time, required int imageIndex}) async {
    imageIndex += 1;
    final json = {
      'Image index : ${imageIndex.toString()}': {
        'time_taken': time,
      }
    };

    await docUser.update(json);
  }

  Future deleteTime({required int imageIndex}) async {
    imageIndex += 1;
    await docUser.update(
        {'Image index : ${imageIndex.toString()}': FieldValue.delete()});
  }
}
