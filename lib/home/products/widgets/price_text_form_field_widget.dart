import 'package:flutter/material.dart';

class PriceTextFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  const PriceTextFormFieldWidget(this.textEditingController, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      autovalidateMode: AutovalidateMode.disabled,
      keyboardType: const TextInputType.numberWithOptions(
        signed: false,
        decimal: true,
      ),
      decoration: const InputDecoration(
        label: Text("Preço do produto"),
        hintText: "Digite um preço",
        suffixText: "R\$",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return "Insira um preço";
        var price = num.tryParse(value);
        if (price == null) return "Insira um preço válido";

        return null;
      },
    );
  }
}
