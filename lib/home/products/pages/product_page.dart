import 'package:flutter/material.dart';
import '../models/product_model_with_relations.dart';
import '../widgets/product_detailed_widget.dart';

class ProductPage extends StatefulWidget {
  final ProductModelWithRelations product;

  const ProductPage(this.product, {super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return ProductDetailedWidget();
  }
}
