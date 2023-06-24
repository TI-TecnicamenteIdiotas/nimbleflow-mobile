import 'package:flutter/material.dart';

import '../../../shared/widgets/vertical_floating_action_buttons.dart';
import 'category_icon_drop_down_button_widget.dart';
import 'color_theme_drop_down_button_widget.dart';
import 'title_text_form_field_widget.dart';

class CategoryDetailed extends StatelessWidget {
  final String? appBarText;
  final GlobalKey<FormState> formKey;
  final TextEditingController titleTextEditingController;
  final int? colorTheme;
  final void Function(Color? value) setColorTheme;
  final int? categoryIcon;
  final void Function(IconData? value) setCategoryIcon;
  final List<Widget> floatingActionButtons;

  const CategoryDetailed({
    super.key,
    this.appBarText,
    required this.formKey,
    required this.titleTextEditingController,
    this.colorTheme,
    required this.setColorTheme,
    this.categoryIcon,
    required this.setCategoryIcon,
    required this.floatingActionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appBarText == null ? null : Text(appBarText!)),
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
                ColorThemeDropDownButtonWidget(colorTheme, setColorTheme),
                const SizedBox(height: 24),
                CategoryIconDropDownButtonWidget(categoryIcon, setCategoryIcon),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: VerticalFloatingActionButtons(
        floatingActionButtons,
      ),
    );
  }
}
