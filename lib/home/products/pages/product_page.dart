import 'package:flutter/material.dart';
import 'package:nimbleflow/shared/widgets/delete_button_widget.dart';
import 'package:nimbleflow/shared/widgets/save_button_widget.dart';
import '../models/product_model_with_relations.dart';
import '../widgets/product_detailed_widget.dart';

class ProductPage extends StatefulWidget {
  final ProductModelWithRelations product;

  const ProductPage(this.product, {super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<bool> save() async {
    return false;
  }

  Future<void> delete() async {}

  @override
  Widget build(BuildContext context) {
    return ProductDetailedWidget(
      floatingActionButtons: [
        SaveButtonWidget(onPressed: save),
        DeleteButtonWidget(onPressed: delete)
      ],
    );
  }
}
