class ProductModel {
  final String id;
  String title;
  String? description;
  num price;
  String? imageUrl;
  bool isFavorite;
  String categoryId;

  ProductModel({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.imageUrl,
    required this.isFavorite,
    required this.categoryId,
  });

  Map<String, dynamic> toStorageMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "price": price,
      "imageUrl": imageUrl,
      "isFavorite": isFavorite ? 1 : 0,
      "categoryId": categoryId,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      imageUrl: json["imageUrl"],
      isFavorite: json["isFavorite"],
      categoryId: json["categoryId"],
    );
  }
}
