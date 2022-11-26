import 'package:flutter/material.dart';
import 'package:flutter_outlook/screens/login_success/components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text(
          "Login Success",
          style: TextStyle(
            color: Color(0xFF8b8b8b),
          ),
        ),
      ),
      body: Body(),
    );
  }
}
