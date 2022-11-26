import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class FormError extends StatelessWidget {
  const FormError({Key? key, required this.errors}) : super(key: key);

  final Set<String> errors;
  // final List<String> errors;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
            (index) => formErrorText(
          errors.toList()[index],
        ),
      ),
    );
  }

  Row formErrorText(String error) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: 14.0,
          width: 14.0,
        ),
        const SizedBox(
          width: kDefaultPadding,
        ),
        Text(error),
      ],
    );
  }
}