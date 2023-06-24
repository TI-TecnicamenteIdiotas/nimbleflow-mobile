class CreateCategoryDto {
  String title;
  int? colorTheme;
  int? categoryIcon;

  CreateCategoryDto({
    required this.title,
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
