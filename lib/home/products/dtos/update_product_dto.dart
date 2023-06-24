class UpdateProductDto {
  final String id;
  String? title;
  String? description;
  num? price;
  String? imageUrl;
  bool? isFavorite;
  String? categoryId;

  UpdateProductDto({
    required this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.isFavorite,
    this.categoryId,
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
