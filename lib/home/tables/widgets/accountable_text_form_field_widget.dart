import 'package:flutter/material.dart';

import '../constants/tables_constants.dart';

class AccountableTextFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  const AccountableTextFormFieldWidget({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Nome do responsável',
        hintText: 'Insira um nome',
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Insira um nome";
        }

        if (value.length > kMaxAccountableLength) {
          return "O nome não pode ser maior que $kMaxAccountableLength";
        }

        return null;
      },
    );
  }
}
