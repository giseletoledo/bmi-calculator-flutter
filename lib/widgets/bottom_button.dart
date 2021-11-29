import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.horizontalBoxWidth,
    required this.horizontalBoxHeight,
    required this.onTap,
    required this.buttonTitle,
  }) : super(key: key);

  final double horizontalBoxWidth;
  final double horizontalBoxHeight;
  final GestureTapCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: largeButtonTextStyle,
        ),
        color: bottomContainerColor,
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.only(bottom: 5.0),
        width: horizontalBoxWidth,
        height: horizontalBoxHeight,
      ),
    );
  }
}
