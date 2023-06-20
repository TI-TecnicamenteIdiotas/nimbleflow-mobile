import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/http_constants.dart';
import '../../models/category/paginated_category_model.dart';

part 'category_service.g.dart';

final _categoryServiceUrl = [
  kCategoryServiceUrl,
  "api/v1/category",
].join("/");

@riverpod
class CategoryService extends _$CategoryService {
  @override
  Future<PaginatedCategoryModel> build() async => PaginatedCategoryModel(
        totalItems: 0,
        items: List.empty(),
      );

  Future<void> httpGet() async {
    state = const AsyncValue.loading();
    var uri = Uri.parse(_categoryServiceUrl);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.noContent) {
      state = AsyncValue.error(List.empty(), StackTrace.current);
    }

    state = AsyncValue.data(
      PaginatedCategoryModel.fromJson(jsonDecode(response.body)),
    );
  }
}
