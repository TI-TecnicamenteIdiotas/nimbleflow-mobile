import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nimbleflow/home/categories/models/category_model.dart';
import 'package:nimbleflow/home/categories/dtos/create_category_dto.dart';

import '../constants/categories_constants.dart';
import '../../../shared/constants/http_constants.dart';
import '../models/paginated_category_model.dart';

abstract class CategoryService {
  static Future<void> httpPostCategory(CreateCategoryDto categoryDto) async {
    var uri = Uri.parse(kTableServiceUrl);

    await http.post(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode(categoryDto.toJson()),
    );
  }

  static Future<PaginatedCategoryModel> httpGetPaginated(int page) async {
    var uri = Uri.parse(
      "$kCategoryServiceUrl?page=$page&limit=$kListOfCategoriesLimit",
    );

    var response = await http.get(
      uri,
      headers: {
        HttpHeaders.acceptHeader: "application/json",
      },
    );

    if (response.statusCode == HttpStatus.noContent) {
      return PaginatedCategoryModel(
        totalItems: 0,
        items: List<CategoryModel>.empty(growable: true),
      );
    }

    return PaginatedCategoryModel.fromJson(jsonDecode(response.body));
  }
}
