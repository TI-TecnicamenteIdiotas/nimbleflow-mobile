import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/dtos/update_category_dto.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';
import 'package:nimbleflow/home/categories/widgets/category_detailed_widget.dart';

import '../../../shared/constants/layout_constants.dart';
import '../../../shared/widgets/delete_button_widget.dart';
import '../../../shared/widgets/save_button_widget.dart';
import '../services/category_service.dart';

class CategoryPage extends StatefulWidget {
  final CategoryModel category;

  const CategoryPage(this.category, {super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final CategoryModel category;

  final formKey = GlobalKey<FormState>();
  final titleTextEditingController = TextEditingController();

  void setCategoryIcon(IconData? value) {
    if (value == null) return;

    setState(() => category.categoryIcon = kListOfIcons.indexOf(value));
  }

  void setColorTheme(Color? value) {
    if (value == null) return;

    setState(() => category.colorTheme = kListOfColors.indexOf(value));
  }

  Future<bool> save() async {
    if (!formKey.currentState!.validate()) return false;

    await CategoryService.httpPutCategory(UpdateCategoryDto(
      id: category.id,
      title: titleTextEditingController.text,
      categoryIcon: category.categoryIcon,
      colorTheme: category.colorTheme,
    ));

    return true;
  }

  Future<void> delete() async {
    await CategoryService.httpDeleteCategory(category.id);
  }

  @override
  void initState() {
    super.initState();
    category = CategoryModel(
      id: widget.category.id,
      title: widget.category.title,
      categoryIcon: widget.category.categoryIcon,
      colorTheme: widget.category.colorTheme,
    );

    titleTextEditingController.text = category.title;
  }

  @override
  void didUpdateWidget(covariant CategoryPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    category
      ..title = widget.category.title
      ..categoryIcon = widget.category.categoryIcon
      ..colorTheme = widget.category.colorTheme;

    titleTextEditingController.text = category.title;
  }

  @override
  void dispose() {
    super.dispose();
    titleTextEditingController.dispose();
    formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CategoryDetailed(
      formKey: formKey,
      titleTextEditingController: titleTextEditingController,
      colorTheme: category.colorTheme,
      setColorTheme: setColorTheme,
      categoryIcon: category.categoryIcon,
      setCategoryIcon: setCategoryIcon,
      floatingActionButtons: [
        SaveButtonWidget(onPressed: save),
        DeleteButtonWidget(onPressed: delete),
      ],
    );
  }
}
