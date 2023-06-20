import 'package:flutter/material.dart';

import '../../../../shared/widgets/floating_action_button_widget.dart';

class DeleteTableButton extends StatefulWidget {
  final Future<void> Function() onPressed;

  const DeleteTableButton({super.key, required this.onPressed});

  @override
  State<DeleteTableButton> createState() => _DeleteTableButtonState();
}

class _DeleteTableButtonState extends State<DeleteTableButton> {
  bool isLoading = false;

  void setIsLoading(bool value) => setState(() => isLoading = value);

  void pop() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButtonWidget(
      heroTag: "delete",
      icon: const Icon(Icons.delete_rounded),
      iconText: "Deletar",
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
