import 'package:bmicalculatorflutter/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent(
      {Key? key, required this.horizontalBoxHeight, this.icon, this.label})
      : super(key: key);

  final double horizontalBoxHeight;
  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Icon(
          icon,
          size: horizontalBoxHeight,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          label ?? '',
          style: labelTextStyle,
        )
      ],
    );
  }
}
