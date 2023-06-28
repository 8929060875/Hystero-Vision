import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hystero/auth/auth.dart';
import 'package:hystero/screens/landing_pg.dart';
import 'package:hystero/utils/size_configs.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  static const routeName = "/main-page";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const LandingPage(); // const LoadingScreen(); //
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
