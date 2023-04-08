import 'package:flutter/material.dart';
import 'package:flutter_outlook/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ImageFromGalleryEx.dart';
import '../../constants.dart';
import '../../responsive.dart';


enum ImageSourceType { gallery, camera }
class Socal extends StatelessWidget {
  const Socal({Key? key}) : super(key: key);

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx()));
  }



  Future<void> _launchUrl() async {
    Uri url = Uri.parse('https://www.instagram.com/minger.zeng/');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(!Responsive.isMobile(context))
        GestureDetector(
          onTap: (){
            _launchUrl();
          },
            child: SvgPicture.asset("assets/icons/instagram.svg")),
        if(!Responsive.isMobile(context))
          Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2),
          child: SvgPicture.asset(
              "assets/icons/feather_dribbble.svg"),
        ),
        if(!Responsive.isMobile(context))
        SvgPicture.asset("assets/icons/feather_twitter.svg"),

        const SizedBox(width: kDefaultPadding,),

        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const SignInScreen();
            }));
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? kDefaultPadding / 2 : kDefaultPadding * 1.5,
              vertical: kDefaultPadding / (Responsive.isDesktop(context) ? 1 : 2),
            ),
          ),
          child: const Text("Login"),
        ),
      ],
    );
  }
}