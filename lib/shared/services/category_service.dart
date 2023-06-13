import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nimbleflow/shared/models/category/category_model.dart';

import '../constants/http_constants.dart';

abstract class CategoryService {
  static final _categoryServiceUrl = [
    kCategoryServiceUrl,
    "api/v1/category",
  ].join("/");

  static Future<List<CategoryModel>?> httpGet() async {
    var uri = Uri.parse(_categoryServiceUrl);
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) return null;

    var jsonList = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    return jsonList.map(CategoryModel.fromJson).toList(growable: true);
  }
}
