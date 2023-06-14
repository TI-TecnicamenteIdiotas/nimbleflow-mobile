import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final String heroTag;
  final bool isLoading;
  final void Function()? onPressed;
  final Icon icon;
  final String iconText;

  const FloatingActionButtonWidget({
    super.key,
    required this.heroTag,
    required this.isLoading,
    required this.onPressed,
    required this.icon,
    required this.iconText,
  });

  List<Widget> _buildChildren() {
    if (isLoading) {
      return const [
        CircularProgressIndicator(),
      ];
    }

    return [
      icon,
      Text(iconText),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      heroTag: heroTag,
      onPressed: isLoading ? null : onPressed,
      child: Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4,
        children: _buildChildren(),
      ),
    );
  }
}
