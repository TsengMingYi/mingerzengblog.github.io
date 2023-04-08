import 'package:flutter/material.dart';
import 'package:flutter_outlook/controllers/MenuController.dart';
import 'package:flutter_outlook/responsive.dart';
import 'package:flutter_outlook/screens/components/socal.dart';
import 'package:flutter_outlook/screens/components/web_menu.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../ImageFromGalleryEx.dart';
import '../../constants.dart';

class Header extends StatelessWidget {

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx()));
  }

  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkBlackColor,
      width: double.infinity,
      // height: 400.0,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              child: Column(
                children: [
                  Row(
                    children: [
                      if(!Responsive.isDesktop(context))
                      IconButton(
                          onPressed: (){
                            _controller.openOrCloseDrawer();
                          },
                          icon: const Icon(Icons.menu),
                        color: Colors.white,
                      ),
                      if(!Responsive.isSmallMobile(context))
                      SvgPicture.asset(
                          "assets/icons/no_idea.svg",
                      ),
                      const Spacer(),
                      if (Responsive.isDesktop(context))
                        WebMenu(),
                      const Spacer(),
                      const Socal(),
                    ],
                  ),
                  const SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  const Text(
                    "Welcome to My Blog",
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if(Responsive.isMobile(context))
                  Padding(
                    padding: const EdgeInsets.only(top: kDefaultPadding),
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Type Here ...",
                        hintStyle: const TextStyle(
                          color: Colors.white60,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding / 2),
                          child: SvgPicture.asset("assets/icons/feather_search.svg"),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kDefaultPadding / 2),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white,
                            // color: Color(0xFFCCCCCC),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      "Continuously update program projects and technical points. \n Maybe document my life sometimes?",
                      // "Stay updated with the newest design and development stories, case studies, \nand insights shared by DesignDK Team.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Raleway",
                        height: 1.5,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: TextButton(
                      onPressed: () {
                        // _handleURLButtonPress(context, ImageSourceType.gallery);
                      },
                      child: Row(
                        children: const [
                          Text("Learn More",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: kDefaultPadding / 2,),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if(Responsive.isDesktop(context))
                  const SizedBox(height: kDefaultPadding,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
