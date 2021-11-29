import 'package:flutter/material.dart';

import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({Key? key, this.icon, this.onPressed}) : super(key: key);

  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(icon),
      style: ElevatedButton.styleFrom(
        primary: roundIconButtonColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24),
      ),
      onPressed: onPressed ?? () {},
    );
  }
}
