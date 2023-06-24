import 'package:nimbleflow/home/categories/models/category_model.dart';

class PaginatedCategoryModel {
  final int totalItems;
  final List<CategoryModel> items;

  PaginatedCategoryModel({
    required this.totalItems,
    required this.items,
  });

  factory PaginatedCategoryModel.fromJson(Map<String, dynamic> json) {
    var itemsIterable = Iterable
        .castFrom<dynamic, Map<String, dynamic>>(json["items"])
        .map(CategoryModel.fromJson);

    return PaginatedCategoryModel(
      totalItems: json["totalItems"],
      items: List.from(itemsIterable),
    );
  }
}
