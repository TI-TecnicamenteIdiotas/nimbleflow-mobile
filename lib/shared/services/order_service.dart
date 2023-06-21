import '../constants/http_constants.dart';
import '../../home/orders/models/order_model.dart';

abstract class OrderService {
  static final _orderServiceUrl = [
    kOrderBaseServiceUrl,
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
