import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nimbleflow/home/products/models/product_model.dart';

import '../constants/http_constants.dart';

abstract class ProductService {
  static Future<List<ProductModel>?> httpGet() async {
    var uri = Uri.parse(kProductServiceUrl);
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) return null;

    var jsonList = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    return jsonList.map(ProductModel.fromJson).toList(growable: true);
  }
}
