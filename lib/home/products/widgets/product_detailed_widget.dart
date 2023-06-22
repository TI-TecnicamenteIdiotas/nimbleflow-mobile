import 'package:flutter/material.dart';
import 'package:nimbleflow/shared/widgets/vertical_floating_action_buttons.dart';

class ProductDetailedWidget extends StatelessWidget {
  final String? appBarText;
  final List<Widget> floatingActionButtons;

  const ProductDetailedWidget({
    super.key,
    this.appBarText,
    required this.floatingActionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarText == null ? null : Text(appBarText!),
      ),
      floatingActionButton: VerticalFloatingActionButtons(
        floatingActionButtons,
      ),
    );
  }
}
