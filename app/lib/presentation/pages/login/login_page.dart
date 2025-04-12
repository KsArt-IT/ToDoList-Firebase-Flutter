import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("LoginPage::build: ok");

    return const Scaffold(body: Center(child: Text('LoginPage')));
  }
}
