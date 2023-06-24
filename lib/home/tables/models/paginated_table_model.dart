import 'table_model.dart';

class PaginatedTableModel {
  final int totalItems;
  final List<TableModel> items;

  PaginatedTableModel({
    required this.totalItems,
    required this.items,
  });

  factory PaginatedTableModel.fromJson(Map<String, dynamic> json) {
    var itemsIterable = Iterable
        .castFrom<dynamic, Map<String, dynamic>>(json["items"])
        .map(TableModel.fromJson);

    return PaginatedTableModel(
      totalItems: json["totalItems"],
      items: List.from(itemsIterable),
    );
  }
}
