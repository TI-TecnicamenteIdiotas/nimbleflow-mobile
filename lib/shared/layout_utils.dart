import 'package:flutter/material.dart';

import 'constants/layout_constants.dart';

Color getColorByCategoryColorTheme(int? categoryColorTheme) {
  if (categoryColorTheme == null) return kListOfColors[0];
  if (categoryColorTheme > kListOfColors.length - 1) {
    return kListOfColors[0];
  }

  return kListOfColors[categoryColorTheme];
}