import 'package:flutter/material.dart';

import 'floating_action_button_widget.dart';

class SaveButtonWidget extends StatefulWidget {
  final Future<void> Function() onPressed;

  const SaveButtonWidget({super.key, required this.onPressed});

  @override
  State<SaveButtonWidget> createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends State<SaveButtonWidget> {
  bool isLoading = false;

  void setIsLoading(bool value) => setState(() => isLoading = value);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButtonWidget(
      heroTag: "save",
      icon: const Icon(Icons.save_rounded),
      iconText: "Salvar",
      isLoading: isLoading,
      onPressed: () async {
        setIsLoading(true);
        await widget.onPressed();
        setIsLoading(false);
      },
    );
  }
}
