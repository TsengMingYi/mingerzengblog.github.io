import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({Key? key, required this.svgIcon}) : super(key: key);

  final String svgIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          0, kDefaultPadding, kDefaultPadding, kDefaultPadding),
      child: SvgPicture.asset(
        svgIcon,
        height: 18.0,
      ),
    );
  }
}