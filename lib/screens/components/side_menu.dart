import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../controllers/MenuController.dart';

class SideMenu extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kDarkBlackColor,
        child: Obx(
              () => ListView(
            children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 3.5),
                  child: SvgPicture.asset("assets/icons/no_idea.svg"),
                ),
              ),
              ...List.generate(
                _controller.menuItems.length,
                    (index) => DrawerItem(
                  isActive: index == _controller.selectedIndex,
                  title: _controller.menuItems[index],
                  press: () {
                    _controller.pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
                    _controller.setMenuIndex(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final void Function() press;

  const DrawerItem(
      {Key? key,
        required this.title,
        required this.isActive,
        required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: kDarkBlackColor,
        child: ListTile(
          selected: isActive,
          selectedTileColor: kPrimaryColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          onTap: press,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
