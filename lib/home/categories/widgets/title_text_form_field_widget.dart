import 'package:flutter/material.dart';

import '../constants/categories_constants.dart';

class TitleTextFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  const TitleTextFormFieldWidget({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: const InputDecoration(
        labelText: 'Título',
        hintText: 'Insira um título',
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Insira um título";
        }

        if (value.length > kMaxTitleLength) {
          return "O título não pode ser maior que $kMaxTitleLength";
        }

        return null;
      },
    );
  }
}
