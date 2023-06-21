import '../models/order_model.dart';

abstract class OrderService {
  static Future<List<OrderModel>?> httpGet() async {
    throw Exception();
  }
}
