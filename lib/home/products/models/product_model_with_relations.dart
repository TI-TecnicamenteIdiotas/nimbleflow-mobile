import 'package:nimbleflow/home/categories/models/category_model.dart';
import 'package:nimbleflow/shared/constants/storage_constants.dart';

class ProductModelWithRelations {
  final String id;
  String title;
  String? description;
  num price;
  String? imageUrl;
  bool isFavorite;
  CategoryModel category;

  ProductModelWithRelations({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.imageUrl,
    required this.isFavorite,
    required this.category,
  });

  factory ProductModelWithRelations.fromStorageMap(Map<String, dynamic> map) {
    return ProductModelWithRelations(
      id: map["${kProductTableName}_id"],
      title: map["${kProductTableName}_title"],
      description: map["${kProductTableName}_description"],
      price: map["${kProductTableName}_price"],
      imageUrl: map["${kProductTableName}_imageUrl"],
      isFavorite: map["${kProductTableName}_isFavorite"] == 1 ? true : false,
      category: CategoryModel.fromStorageMap(map),
    );
  }
}
