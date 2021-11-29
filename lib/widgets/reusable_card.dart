import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour,
      this.cardChild,
      this.onPress,
      this.heightContainer,
      this.widthContainer});

  final Color colour;
  final Widget? cardChild;
  final GestureTapCallback? onPress;
  final heightContainer;
  final widthContainer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? () {},
      child: Container(
        width: widthContainer,
        height: heightContainer,
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
