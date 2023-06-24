import 'package:flutter/material.dart';
import 'package:nimbleflow/home/products/constants/products_constants.dart';

class TitleTextFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  const TitleTextFormFieldWidget(this.textEditingController, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        label: Text("Título do produto"),
        hintText: "Digite um título",
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) return "Insira um título";
        if (value.length > kMaxTitleLength) {
          return "Título deve ser menor que $kMaxTitleLength";
        }

        return null;
      },
    );
  }
}
