import 'package:bmi_calculator/app_utilities/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconContent extends StatelessWidget {
  var icon;
  var txt;
  IconContent({super.key, this.icon, this.txt});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
      const  SizedBox(
          height: 18.0,
        ),
        Text(
          txt,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
