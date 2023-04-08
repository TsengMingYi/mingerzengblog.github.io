import 'package:flutter/material.dart';
import 'package:flutter_outlook/constants.dart';
import 'package:flutter_outlook/screens/sign_in/components/sign_form.dart';
import 'package:flutter_outlook/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/custom_surfix_icon.dart';
import '../../components/form_error.dart';
import '../../components/no_account_text.dart';
import '../../components/socal_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: kDefaultPadding,),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: kDefaultPadding * 2,),
                const SignForm(),
                const SizedBox(height: kDefaultPadding * 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPadding,),
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

