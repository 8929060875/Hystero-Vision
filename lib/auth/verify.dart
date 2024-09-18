import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hystero/screens/registration.dart';

class Verification extends StatefulWidget {
  static const routeName = '/verification';
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      checkEmailVerification();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 141, 199, 1),
      ),
      body: const Center(
        child: Text(
          'Please check your email or spam for verification',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future<void> checkEmailVerification() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacementNamed(RegistrationPage.routeName);
    }
  }
}
