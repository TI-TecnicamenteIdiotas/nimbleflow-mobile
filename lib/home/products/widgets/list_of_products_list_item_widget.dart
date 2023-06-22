import 'package:flutter/material.dart';
import 'package:nimbleflow/home/products/models/product_model_with_relations.dart';
import 'package:nimbleflow/home/products/pages/product_page.dart';

class ListOfProductsListItemWidget extends StatelessWidget {
  final ProductModelWithRelations product;

  const ListOfProductsListItemWidget(this.product, {super.key});

  Widget buildNetworkImage() {
    var fallbackImage = const FlutterLogo(size: 64.0);

    if (product.imageUrl == null || product.imageUrl!.isEmpty) {
      return fallbackImage;
    }

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Image.network(
        product.imageUrl!,
        errorBuilder: (_, __, ___) => fallbackImage,
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return const CircularProgressIndicator();
        },
        height: 64,
        width: 64,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey<String>(product.id),
      elevation: 1,
      child: ListTile(
        leading: buildNetworkImage(),
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
              builder: (context) => ProductPage(product),
            ),
          );
        },
      ),
    );
  }
}
