import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/pages/category_page.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';

import '../../../shared/constants/list_of_icons_constants.dart';

class ListOfCategoriesListItemWidget extends StatelessWidget {
  final CategoryModel category;

  const ListOfCategoriesListItemWidget(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    var listOfIconsMaxIndex = kListOfIcons.length - 1;
    var listOfColorsMaxIndex = kListOfColors.length - 1;

    return Card(
      key: ValueKey<String>(category.id),
      elevation: 2,
      child: ListTile(
        title: Text(category.title),
        leading: Icon(
          kListOfIcons[(category.categoryIcon ?? 0) <= listOfIconsMaxIndex
              ? (category.categoryIcon ?? 0)
              : 0],
          color: kListOfColors[(category.colorTheme ?? 0) <= listOfColorsMaxIndex
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
