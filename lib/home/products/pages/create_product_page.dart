import 'package:flutter/material.dart';
import 'package:nimbleflow/shared/widgets/cancel_button_widget.dart';
import 'package:nimbleflow/shared/widgets/create_button_widget.dart';

import '../widgets/product_detailed_widget.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {

  Future<bool> create() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ProductDetailedWidget(
      appBarText: "Novo produto",
      floatingActionButtons: [
        CreateButtonWidget(onPressed: create),
        const CancelButtonWidget()
      ],
    );
  }
}
