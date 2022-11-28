import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_outlook/constants.dart';
import 'package:flutter_outlook/screens/careers/careers_screen.dart';
import 'package:flutter_outlook/screens/contact/contact_screen.dart';
import 'package:flutter_outlook/screens/home/home_screen.dart';
import 'package:flutter_outlook/screens/services/services_screen.dart';
import 'package:get/get.dart';

import '../controllers/MenuController.dart';
import 'cases/cases_screen.dart';
import 'components/header.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              child: SafeArea(
                child: ExpandablePageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller.pageController,
                  children: const [
                    HomeScreen(),
                    CasesScreen(),
                    ServicesScreen(),
                    CareersScreen(),
                    ContactScreen(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
