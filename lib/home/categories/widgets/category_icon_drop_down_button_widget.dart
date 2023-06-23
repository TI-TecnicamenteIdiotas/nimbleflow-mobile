import 'package:flutter/material.dart';

import '../../../shared/constants/layout_constants.dart';

class CategoryIconDropDownButtonWidget extends StatelessWidget {
  final int? categoryIcon;
  final void Function(IconData?) setIcon;

  const CategoryIconDropDownButtonWidget(this.categoryIcon, this.setIcon,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<IconData>(
      decoration: const InputDecoration(label: Text("Ícone da categoria")),
      isExpanded: true,
      value: categoryIcon == null ? null : kListOfIcons[categoryIcon!],
      items: kListOfIcons.map(
        (element) {
          return DropdownMenuItem<IconData>(
            value: element,
            child: Icon(element),
          );
        },
      ).toList(),
      onChanged: setIcon,
    );
  }
}
