import 'package:flutter/material.dart';

import '../../../shared/constants/layout_constants.dart';

class ColorThemeDropDownButtonWidget extends StatelessWidget {
  final int? colorTheme;
  final void Function(Color?) setColorTheme;

  const ColorThemeDropDownButtonWidget(this.colorTheme, this.setColorTheme,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Color>(
      hint: const Text("Cor da categoria"),
      isExpanded: true,
      value: colorTheme == null ? null : kListOfColors[colorTheme!],
      items: kListOfColors.map(
        (element) {
          return DropdownMenuItem<Color>(
            value: element,
            child: Container(color: element, height: 20),
          );
        },
      ).toList(),
      onChanged: setColorTheme,
    );
  }
}
