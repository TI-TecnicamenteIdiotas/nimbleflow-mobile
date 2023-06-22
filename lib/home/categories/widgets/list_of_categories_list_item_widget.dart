import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/pages/category_page.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';

import '../../../shared/constants/layout_constants.dart';
import '../../../shared/layout_utils.dart';

class ListOfCategoriesListItemWidget extends StatelessWidget {
  final CategoryModel category;

  const ListOfCategoriesListItemWidget(this.category, {super.key});

  IconData buildIcon() {
    if (category.categoryIcon == null) return kListOfIcons[0];
    if (category.categoryIcon! > kListOfIcons.length - 1) {
      return kListOfIcons[0];
    }

    return kListOfIcons[category.categoryIcon!];
  }

  @override
  Widget build(BuildContext context) {
    var color = getColorByCategoryColorTheme(category.colorTheme);
    var colorWithOpacity = color.withOpacity(0.2);

    return Card(
      shadowColor: colorWithOpacity,
      color: colorWithOpacity,
      elevation: 1,
      key: ValueKey<String>(category.id),
      child: ListTile(
        title: Text(category.title),
        leading: Icon(buildIcon(), color: color),
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
