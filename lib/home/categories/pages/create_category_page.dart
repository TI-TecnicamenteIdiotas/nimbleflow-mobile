import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/services/category_service.dart';
import 'package:nimbleflow/shared/constants/list_of_icons_constants.dart';
import 'package:nimbleflow/shared/widgets/vertical_floating_action_buttons.dart';

import '../../../shared/widgets/cancel_button_widget.dart';
import '../../../shared/widgets/create_button_widget.dart';
import '../dtos/create_category_dto.dart';
import '../widgets/title_text_form_field_widget.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text("Nova categoria")),
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
                DropdownButton<Color>(
                  hint: const Text("Cor da categoria"),
                  isExpanded: true,
                  value: colorTheme == null ? null : kListOfColors[colorTheme!],
                  items: kListOfColors.map(
                    (element) {
                      return DropdownMenuItem<Color>(
                        value: element,
                        child: Container(color: element, height: 20),
                      );
                    },
                  ).toList(),
                  onChanged: setColorTheme,
                ),
                const SizedBox(height: 24),
                DropdownButton<IconData>(
                  hint: const Text("Ícone da categoria"),
                  isExpanded: true,
                  value:
                      categoryIcon == null ? null : kListOfIcons[categoryIcon!],
                  items: kListOfIcons.map(
                    (element) {
                      return DropdownMenuItem<IconData>(
                        value: element,
                        child: Icon(element),
                      );
                    },
                  ).toList(),
                  onChanged: setCategoryIcon,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: VerticalFloatingActionButtons(
        [
          CreateButtonWidget(onPressed: create),
          const CancelButtonWidget(),
        ],
      ),
    );
  }
}
