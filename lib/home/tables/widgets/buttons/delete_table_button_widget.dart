import 'package:flutter/material.dart';

import '../../../../shared/widgets/floating_action_button_widget.dart';

class DeleteTableButtonWidget extends StatefulWidget {
  final Future<void> Function() onPressed;

  const DeleteTableButtonWidget({super.key, required this.onPressed});

  @override
  State<DeleteTableButtonWidget> createState() => _DeleteTableButtonWidgetState();
}

class _DeleteTableButtonWidgetState extends State<DeleteTableButtonWidget> {
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
