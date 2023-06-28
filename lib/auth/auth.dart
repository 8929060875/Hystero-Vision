import 'package:flutter/material.dart';
import 'package:hystero/auth/login.dart';
import 'package:hystero/auth/signin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(
        showRegisterPage: toggleScreens,
      );
    } else {
      return SignInPage(
        showLoginPage: toggleScreens,
      );
    }
  }
}
