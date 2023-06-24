import 'package:flutter/material.dart';

class SwitchWithIconWidget extends StatelessWidget {
  final String title;
  final bool initialValue;
  final void Function(bool value) onChanged;
  final Icon? prefixIcon;

  SwitchWithIconWidget({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
    this.prefixIcon
  });

  final _thumbIcon = MaterialStateProperty.resolveWith<Icon>((states) {
    if (!states.contains(MaterialState.selected)) {
      return const Icon(Icons.close);
    }

    return const Icon(Icons.check);
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: initialValue,
      onChanged: onChanged,
      thumbIcon: _thumbIcon,
      secondary: prefixIcon,
    );
  }
}
