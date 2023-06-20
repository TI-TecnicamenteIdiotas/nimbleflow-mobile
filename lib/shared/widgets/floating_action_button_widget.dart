import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nimbleflow/shared/providers/is_loading.dart';

class FloatingActionButtonWidget extends ConsumerWidget {
  final String heroTag;
  final void Function()? onPressed;
  final Icon icon;
  final String iconText;

  const FloatingActionButtonWidget({
    super.key,
    required this.heroTag,
    required this.onPressed,
    required this.icon,
    required this.iconText,
  });

  List<Widget> _buildChildren(bool isLoading) =>
      isLoading ? const [CircularProgressIndicator()] : [icon, Text(iconText)];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isLoading = ref.watch(isLoadingProvider);

    return FloatingActionButton.large(
      heroTag: heroTag,
      onPressed: isLoading ? null : onPressed,
      child: Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4,
        children: _buildChildren(isLoading),
      ),
    );
  }
}
