import 'package:flutter/material.dart';
import 'package:flutter_outlook/screens/forgot_password/forgot_password_screen.dart';

import '../../constants.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? ",
          style: TextStyle(
              fontSize: 16.0
          ),
        ),
        GestureDetector(
          onTap: (){},
          child: const Text("Sign Up",
            style: TextStyle(
              fontSize: 16.0,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}