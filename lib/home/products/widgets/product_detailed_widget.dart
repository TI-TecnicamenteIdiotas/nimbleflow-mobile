import 'package:flutter/material.dart';

class ProductDetailedWidget extends StatelessWidget {
  final String? appBarText;

  const ProductDetailedWidget({
    super.key,
    this.appBarText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarText == null ? null : Text(appBarText!),
      ),
    );
  }
}
