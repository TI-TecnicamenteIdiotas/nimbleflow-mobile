import 'package:nimbleflow/home/products/models/product_model.dart';

class PaginatedProductModel {
  final int totalItems;
  final List<ProductModel> items;

  PaginatedProductModel({
    required this.totalItems,
    required this.items,
  });

  factory PaginatedProductModel.fromJson(Map<String, dynamic> json) {
    var itemsIterable = Iterable
        .castFrom<dynamic, Map<String, dynamic>>(json["items"])
        .map(ProductModel.fromJson);

    return PaginatedProductModel(
      totalItems: json["totalItems"],
      items: List.from(itemsIterable),
    );
  }
}
