import 'package:flutter/material.dart';

class DescriptionTextFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  const DescriptionTextFormFieldWidget(this.textEditingController, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        label: Text("Descrição do produto (opcional)"),
        hintText: "Digite uma descrição",
      ),
    );
  }
}
