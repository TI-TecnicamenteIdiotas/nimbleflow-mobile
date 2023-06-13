import '../constants/http_constants.dart';
import '../models/order/order_model.dart';

abstract class OrderService {
  static final _orderServiceUrl = [
    kOrderServiceUrl,
    "api/v1/order",
  ].join("/");

  static Future<List<OrderModel>?> httpGet() async {
    // var uri = Uri.parse(_orderServiceUrl);
    // var response = await http.get(uri);
    // if (response.statusCode != HttpStatus.ok) return null;
    //
    // var jsonList = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    // return jsonList.map(TableModel.fromJson).toList(growable: true);
    throw Exception();
  }
}
