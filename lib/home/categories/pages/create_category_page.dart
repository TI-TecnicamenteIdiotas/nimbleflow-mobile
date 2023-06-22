import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/services/category_service.dart';
import 'package:nimbleflow/home/categories/widgets/category_detailed_widget.dart';
import 'package:nimbleflow/shared/constants/layout_constants.dart';

import '../../../shared/widgets/cancel_button_widget.dart';
import '../../../shared/widgets/create_button_widget.dart';
import '../dtos/create_category_dto.dart';

class CreateCategoryPage extends StatefulWidget {
  const CreateCategoryPage({super.key});

  @override
  State<CreateCategoryPage> createState() => _CreateCategoryPageState();
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  final formKey = GlobalKey<FormState>();

  final titleTextEditingController = TextEditingController();
  int? categoryIcon;
  int? colorTheme;

  void setCategoryIcon(IconData? value) {
    if (value == null) return;

    setState(() => categoryIcon = kListOfIcons.indexOf(value));
  }

  void setColorTheme(Color? value) {
    if (value == null) return;

    setState(() => colorTheme = kListOfColors.indexOf(value));
  }

  Future<bool> create() async {
    if (!formKey.currentState!.validate()) return false;

    await CategoryService.httpPostCategory(
      CreateCategoryDto(
        title: titleTextEditingController.text,
        colorTheme: colorTheme,
        categoryIcon: categoryIcon,
      ),
    );

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return CategoryDetailed(
      appBarText: "Nova categoria",
      formKey: formKey,
      titleTextEditingController: titleTextEditingController,
      setColorTheme: setColorTheme,
      setCategoryIcon: setCategoryIcon,
      floatingActionButtons: [
        CreateButtonWidget(onPressed: create),
        const CancelButtonWidget(),
      ],
    );
  }
}
