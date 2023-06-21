class CategoryModel {
  final String id;
  String title;
  int? colorTheme;
  int? categoryIcon;

  CategoryModel({
    required this.id,
    required this.title,
    this.colorTheme,
    this.categoryIcon,
  });

  Map<String, dynamic> toStorageMap() {
    return {
      "id": id,
      "title": title,
      "colorTheme": colorTheme,
      "categoryIcon": categoryIcon,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      title: json["title"],
      colorTheme: json["colorTheme"],
      categoryIcon: json["categoryIcon"],
    );
  }
}
