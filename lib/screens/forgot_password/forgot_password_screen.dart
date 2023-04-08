import 'package:flutter/material.dart';
import 'package:flutter_outlook/screens/forgot_password/components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
          style: TextStyle(
            color: Color(0xFF8b8b8b),
          ),
        ),
      ),
      body: const Body(),
    );
  }
}
