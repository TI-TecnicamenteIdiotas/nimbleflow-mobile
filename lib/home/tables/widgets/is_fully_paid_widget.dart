import 'package:flutter/material.dart';

import '../../../shared/widgets/switch_with_icon_widget.dart';

class IsFullyPaidWidget extends StatelessWidget {
  final bool initialValue;
  final void Function(bool value) onChanged;

  const IsFullyPaidWidget({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchWithIconWidget(
      title: "Está paga?",
      initialValue: initialValue,
      onChanged: onChanged,
      prefixIcon: const Icon(Icons.attach_money_rounded),
    );
  }
}
