import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nimbleflow/shared/models/product/product_model.dart';

import '../../constants/http_constants.dart';

final _productServiceUrl = [
  kProductServiceUrl,
  "api/v1/product",
].join("/");

abstract class ProductService {
  static Future<List<ProductModel>?> httpGet() async {
    var uri = Uri.parse(_productServiceUrl);
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) return null;

    var jsonList = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    return jsonList.map(ProductModel.fromJson).toList(growable: true);
  }
}
