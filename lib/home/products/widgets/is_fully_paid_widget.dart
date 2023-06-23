import 'package:flutter/material.dart';

import '../../../shared/widgets/switch_with_icon_widget.dart';

class IsFavoriteWidget extends StatelessWidget {
  final bool initialValue;
  final void Function(bool value) onChanged;

  const IsFavoriteWidget({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchWithIconWidget(
      title: "É favorito?",
      initialValue: initialValue,
      onChanged: onChanged,
      prefixIcon: null,
    );
  }
}
