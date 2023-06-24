class UpdateCategoryDto {
  final String id;
  String? title;
  int? colorTheme;
  int? categoryIcon;

  UpdateCategoryDto({
    required this.id,
    this.title,
    this.colorTheme,
    this.categoryIcon,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "colorTheme": colorTheme,
      "categoryIcon": categoryIcon,
    };
  }
}