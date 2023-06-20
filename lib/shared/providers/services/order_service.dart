import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/http_constants.dart';

part 'order_service.g.dart';

final _orderServiceUrl = [
  kOrderServiceUrl,
  "api/v1/order",
].join("/");

@riverpod
class OrderService extends _$OrderService {
  @override
  Future<void> build() async => throw UnimplementedError();

  Future<void> httpGet() async {
    state = const AsyncValue.loading();
    state = AsyncValue.error("UnimplementedError", StackTrace.current);
  }
}
