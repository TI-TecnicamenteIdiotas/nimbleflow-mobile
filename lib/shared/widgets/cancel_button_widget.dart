import 'package:flutter/material.dart';

import 'floating_action_button_widget.dart';

class CancelButtonWidget extends StatelessWidget {
  const CancelButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButtonWidget(
      heroTag: "cancel",
      icon: const Icon(Icons.cancel_outlined),
      iconText: "Cancelar",
      isLoading: false,
      onPressed: () => Navigator.pop(context),
    );
  }
}
