import 'package:flutter/material.dart';
import 'package:kinkao/views/login_page.dart';
import 'package:kinkao/views/signup_page.dart';

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
      return LoginPage(showSignUpPage: toggleScreens);
    } else {
      return SignUpPage(showLoginPage: toggleScreens);
    }
  }
}
