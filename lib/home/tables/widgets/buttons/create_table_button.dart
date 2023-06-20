import 'package:flutter/material.dart';

import '../../../../shared/widgets/floating_action_button_widget.dart';

class CreateTableButton extends StatefulWidget {
  final Future<void> Function() onPressed;

  const CreateTableButton({super.key, required this.onPressed});

  @override
  State<CreateTableButton> createState() => _CreateTableButtonButtonState();
}

class _CreateTableButtonButtonState extends State<CreateTableButton> {
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
        await widget.onPressed();
        setIsLoading(false);
        pop();
      },
    );
  }
}