import 'package:flutter/material.dart';
import 'package:flutter_outlook/screens/main_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Image.asset(
            "assets/images/success.png",
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          const Text(
            "Login Success",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 50.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                    (route) => route == null);
              },
              child: const Text(
                "Back to home",
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
