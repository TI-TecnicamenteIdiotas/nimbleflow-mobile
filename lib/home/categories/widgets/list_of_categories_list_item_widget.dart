import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/pages/category_page.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';

class ListOfCategoriesListItemWidget extends StatelessWidget {
  final CategoryModel category;
  final List<IconData> listOfIcons = [
    Icons.fastfood_rounded,
    Icons.ac_unit_outlined,
  ];
  final List<Color> listOfColors = [
    Colors.red,
    Colors.blue,
  ];

  ListOfCategoriesListItemWidget(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    var listOfIconsMaxIndex = listOfIcons.length - 1;
    var listOfColorsMaxIndex = listOfColors.length - 1;

    return Card(
      key: ValueKey<String>(category.id),
      elevation: 2,
      child: ListTile(
        title: Text(category.title),
        leading: Icon(
          listOfIcons[(category.categoryIcon ?? 0) <= listOfIconsMaxIndex
              ? (category.categoryIcon ?? 0)
              : 0],
          color: listOfColors[(category.colorTheme ?? 0) <= listOfColorsMaxIndex
              ? (category.colorTheme ?? 0)
              : 0],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryPage(category),
            ),
          );
        },
      ),
    );
  }
}
