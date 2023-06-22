import 'package:flutter/material.dart';
import 'package:nimbleflow/home/products/models/product_model.dart';
import 'package:nimbleflow/home/products/pages/product_page.dart';

class ListOfProductsListItemWidget extends StatelessWidget {
  final ProductModel product;

  const ListOfProductsListItemWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey<String>(product.id),
      elevation: 1,
      child: ListTile(
        title: Text(product.title),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(product),
            ),
          );
        },
      ),
    );
  }
}
