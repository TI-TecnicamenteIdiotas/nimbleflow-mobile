import 'package:flutter/material.dart';

import '../../categories/models/category_model.dart';

class SelectCategoryDropDownButtonWidget extends StatelessWidget {
  final CategoryModel? initialValue;
  final List<CategoryModel> listOfCategories;
  final void Function(CategoryModel? value) setCategory;

  const SelectCategoryDropDownButtonWidget(
      this.initialValue, this.listOfCategories, this.setCategory,
      {super.key});

  CategoryModel? getCategoryByIdComparison() {
    if (initialValue == null) {
      return null;
    }

    var matchingCategory = listOfCategories
        .where((element) => element.id == initialValue!.id)
        .first;

    return matchingCategory;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CategoryModel>(
      alignment: Alignment.bottomLeft,
      decoration: const InputDecoration(label: Text("Categoria do produto")),
      value: getCategoryByIdComparison(),
      items: listOfCategories.map(
        (element) {
          return DropdownMenuItem<CategoryModel>(
            value: element,
            child: Text(element.title),
          );
        },
      ).toList(),
      onChanged: setCategory,
      validator: (value) {
        if (value == null) {
          return "Selecione uma categoria";
        }

        return null;
      },
    );
  }
}
