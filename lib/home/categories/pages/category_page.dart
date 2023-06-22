import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/dtos/update_category_dto.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';

import '../../../shared/constants/layout_constants.dart';
import '../../../shared/widgets/delete_button_widget.dart';
import '../../../shared/widgets/save_button_widget.dart';
import '../../../shared/widgets/vertical_floating_action_buttons.dart';
import '../services/category_service.dart';
import '../widgets/title_text_form_field_widget.dart';

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

  DropdownButton buildColorThemeDropDownButton() {
    var value = switch (category.colorTheme) {
      null => kListOfColors[0],
      _ => kListOfColors[category.colorTheme!],
    };

    return DropdownButton<Color>(
      hint: const Text("Cor da categoria"),
      isExpanded: true,
      value: value,
      items: kListOfColors.map(
        (element) {
          return DropdownMenuItem<Color>(
            value: element,
            child: Container(color: element, height: 20),
          );
        },
      ).toList(),
      onChanged: setColorTheme,
    );
  }

  DropdownButton buildCategoryIconDropDownButton() {
    var value = switch (category.categoryIcon) {
      null => kListOfIcons[0],
      _ => kListOfIcons[category.categoryIcon!]
    };

    return DropdownButton<IconData>(
      hint: const Text("Ícone da categoria"),
      isExpanded: true,
      value: value,
      items: kListOfIcons.map(
        (element) {
          return DropdownMenuItem<IconData>(
            value: element,
            child: Icon(element),
          );
        },
      ).toList(),
      onChanged: setCategoryIcon,
    );
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
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextFormFieldWidget(
                  textEditingController: titleTextEditingController,
                ),
                const SizedBox(height: 24),
                buildColorThemeDropDownButton(),
                const SizedBox(height: 24),
                buildCategoryIconDropDownButton(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: VerticalFloatingActionButtons(
        [
          SaveButtonWidget(onPressed: save),
          DeleteButtonWidget(onPressed: delete),
        ],
      ),
    );
  }
}
