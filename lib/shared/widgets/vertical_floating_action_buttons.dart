import 'package:flutter/material.dart';

class VerticalFloatingActionButtons extends StatelessWidget {
  final List<Widget> buttons;

  const VerticalFloatingActionButtons(this.buttons, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 24,
      children: buttons,
    );
  }
}
