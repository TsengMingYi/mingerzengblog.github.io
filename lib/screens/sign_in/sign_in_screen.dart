import 'package:flutter/material.dart';
import 'package:flutter_outlook/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign In",style: TextStyle(
          color: Color(0xFF8b8b8b),
        ),
        ),
      ),
      body: Body(),
    );
  }
}
