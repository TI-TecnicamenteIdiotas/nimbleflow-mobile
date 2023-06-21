import 'package:flutter/material.dart';

import 'floating_action_button_widget.dart';

class CreateButtonWidget extends StatefulWidget {
  final Future<bool> Function() onPressed;

  const CreateButtonWidget({super.key, required this.onPressed});

  @override
  State<CreateButtonWidget> createState() => _CreateTableButtonButtonState();
}

class _CreateTableButtonButtonState extends State<CreateButtonWidget> {
  bool isLoading = false;

  void setIsLoading(bool value) => setState(() => isLoading = value);

  void pop() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButtonWidget(
      heroTag: "create",
      icon: const Icon(Icons.save_rounded),
      iconText: "Salvar",
      isLoading: isLoading,
      onPressed: () async {
        setIsLoading(true);
        var response = await widget.onPressed();
        setIsLoading(false);

        if (!response) return;
        pop();
      },
    );
  }
}
