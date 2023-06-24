import 'dart:io';

import 'package:flutter/material.dart';

import 'constants/layout_constants.dart';

Color getColorByCategoryColorTheme(int? categoryColorTheme) {
  if (categoryColorTheme == null) return kListOfColors[0];
  if (categoryColorTheme > kListOfColors.length - 1) {
    return kListOfColors[0];
  }

  return kListOfColors[categoryColorTheme];
}

Image getImageByUrl(String? imageUrl, double size) {
  var fallbackImage = Image.asset(
    kImageNotFoundAssetPath,
    fit: BoxFit.cover,
    width: size,
    height: size,
  );

  if (imageUrl == null || imageUrl.trim().isEmpty) return fallbackImage;

  return Image.network(
    imageUrl,
    fit: BoxFit.cover,
    width: size,
    height: size,
    errorBuilder: (_, __, ___) {
      return Image.file(
        File(imageUrl),
        fit: BoxFit.cover,
        width: size,
        height: size,
        errorBuilder: (_, __, ___) => fallbackImage,
      );
    },
    loadingBuilder: (_, child, loadingProgress) {
      if (loadingProgress == null) return child;

      return const CircularProgressIndicator();
    },
  );
}
