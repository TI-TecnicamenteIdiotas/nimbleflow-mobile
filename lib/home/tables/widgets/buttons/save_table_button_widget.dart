import 'package:flutter/material.dart';

import '../../../../shared/widgets/floating_action_button_widget.dart';

class SaveTableButtonWidget extends StatefulWidget {
  final Future<void> Function() onPressed;

  const SaveTableButtonWidget({super.key, required this.onPressed});

  @override
  State<SaveTableButtonWidget> createState() => _SaveTableButtonWidgetState();
}

class _SaveTableButtonWidgetState extends State<SaveTableButtonWidget> {
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
