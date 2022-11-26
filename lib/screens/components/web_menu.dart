import 'package:flutter/material.dart';
import 'package:flutter_outlook/controllers/MenuController.dart';
import 'package:get/get.dart';
import '../../constants.dart';

class WebMenu extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: List.generate(
          _controller.menuItems.length,
          (index) {
            return WebMenuItem(
                isActive: index == _controller.selectedIndex,
                text: _controller.menuItems[index],
                press: () {
                  _controller.pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
                  _controller.setMenuIndex(index);
                });
          },
        ),
      ),
    );
  }
}

class WebMenuItem extends StatefulWidget {
  const WebMenuItem(
      {Key? key,
      required this.isActive,
      required this.text,
      required this.press})
      : super(key: key);

  final bool isActive;
  final String text;
  final VoidCallback press;

  @override
  State<WebMenuItem> createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  bool _isHover = false;

  Color _borderColor(){
    if(widget.isActive){
      return kPrimaryColor;
    }else if(!widget.isActive && _isHover){
      return kPrimaryColor.withOpacity(0.4);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value){
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: kDefaultDuration,
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: _borderColor(),
                width: 3.0),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
