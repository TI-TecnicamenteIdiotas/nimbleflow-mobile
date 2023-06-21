import 'package:flutter/material.dart';

import 'floating_action_button_widget.dart';

class DeleteButtonWidget extends StatefulWidget {
  final Future<void> Function() onPressed;

  const DeleteButtonWidget({super.key, required this.onPressed});

  @override
  State<DeleteButtonWidget> createState() => _DeleteButtonWidgetState();
}

class _DeleteButtonWidgetState extends State<DeleteButtonWidget> {
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
