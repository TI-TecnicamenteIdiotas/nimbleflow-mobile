import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nimbleflow/home/products/constants/products_constants.dart';
import 'package:nimbleflow/home/products/models/product_model.dart';

import '../../../shared/constants/http_constants.dart';
import '../dtos/create_product_dto.dart';
import '../dtos/update_product_dto.dart';
import '../models/paginated_product_model.dart';

abstract class ProductService {
  static Future<void> httpPostProduct(CreateProductDto productDto) async {
    var uri = Uri.parse(kProductServiceUrl);

    await http.post(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode(productDto.toJson()),
    );
  }

  static Future<PaginatedProductModel> httpGetPaginated(int page) async {
    var uri = Uri.parse(
      "$kProductServiceUrl?page=$page&limit=$kListOfProductsLimit",
    );

    var response = await http.get(
      uri,
      headers: {
        HttpHeaders.acceptHeader: "application/json",
      },
    );

    if (response.statusCode == HttpStatus.noContent) {
      return PaginatedProductModel(
        totalItems: 0,
        items: List<ProductModel>.empty(growable: true),
      );
    }

    return PaginatedProductModel.fromJson(jsonDecode(response.body));
  }

  static Future<void> httpPutProduct(UpdateProductDto productDto) async {
    var uri = Uri.parse("$kProductServiceUrl/${productDto.id}");

    await http.put(
      uri,
      body: jsonEncode(productDto),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
  }

  static Future<void> httpDeleteManyProducts(List<String> productsIds) async {
    var uri = Uri.parse("$kProductServiceUrl/by-ids");

    await http.delete(
      uri,
      body: jsonEncode(productsIds),
    );
  }

  static Future<void> httpDeleteProduct(String productId) async {
    var uri = Uri.parse("$kProductServiceUrl/$productId");

    await http.delete(uri);
  }
}
