class CreateProductDto {
  String title;
  String? description;
  num price;
  String? imageUrl;
  bool isFavorite;
  String categoryId;

  CreateProductDto({
    required this.title,
    this.description,
    required this.price,
    this.imageUrl,
    required this.isFavorite,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "price": price,
      "imageUrl": imageUrl,
      "isFavorite": isFavorite,
      "categoryId": categoryId,
    };
  }
}
