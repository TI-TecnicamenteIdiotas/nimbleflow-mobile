import 'package:flutter/material.dart';
import 'package:nimbleflow/home/products/models/product_model_with_relations.dart';
import 'package:nimbleflow/home/products/pages/product_page.dart';

import '../../../shared/layout_utils.dart';
import '../../categories/models/category_model.dart';

class ListOfProductsListItemWidget extends StatelessWidget {
  final ProductModelWithRelations product;
  final List<CategoryModel> listOfCategories;

  const ListOfProductsListItemWidget(this.product, this.listOfCategories,
      {super.key});

  @override
  Widget build(BuildContext context) {
    var color = getColorByCategoryColorTheme(product.category.colorTheme)
        .withOpacity(0.2);

    return Card(
      key: ValueKey<String>(product.id),
      color: color,
      shadowColor: color,
      elevation: 1,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: getImageByUrl(product.imageUrl, 64),
        ),
        title: Text(product.title),
        subtitle: Text(
          "R\$ ${product.price.toStringAsFixed(2).padLeft(5, "0")}",
        ),
        trailing: product.isFavorite
            ? const Icon(Icons.star_rounded)
            : const Icon(Icons.star_border_rounded),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(product, listOfCategories),
            ),
          );
        },
      ),
    );
  }
}
