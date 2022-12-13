import 'package:flutter/material.dart';
import 'constants.dart';

class GenderIcon extends StatelessWidget {
  final String genderText;
  final IconData icon;

  GenderIcon(this.genderText, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(height: 15),
        Text(
          genderText,
          style: kTextStyle,
        )
      ],
    );
  }
}
