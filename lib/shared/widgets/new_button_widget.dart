import 'package:flutter/material.dart';
import 'package:nimbleflow/shared/widgets/floating_action_button_widget.dart';

class NewButtonWidget extends StatelessWidget {
  final String text;
  final BuildContext context;
  final Widget newPage;

  const NewButtonWidget(this.text, this.context, this.newPage, {super.key});

  void onPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => newPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButtonWidget(
      heroTag: "new",
      isLoading: false,
      onPressed: onPressed,
      icon: const Icon(Icons.add),
      iconText: text,
    );
  }
}
