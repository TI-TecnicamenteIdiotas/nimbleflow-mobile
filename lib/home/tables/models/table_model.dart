class TableModel {
  final String id;
  String accountable;
  bool isFullyPaid;

  TableModel({
    required this.id,
    required this.accountable,
    required this.isFullyPaid,
  });

  Map<String, dynamic> toStorageMap() {
    return {
      "id": id,
      "accountable": accountable,
      "isFullyPaid": isFullyPaid ? 1 : 0,
    };
  }

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      id: json["id"],
      accountable: json["accountable"],
      isFullyPaid: json["isFullyPaid"],
    );
  }

  factory TableModel.fromStorage(Map<String, dynamic> json) {
    return TableModel(
      id: json["id"],
      accountable: json["accountable"],
      isFullyPaid: json["isFullyPaid"] == 1 ? true : false,
    );
  }

  @override
  String toString() {
    return "TableModel: $id, $accountable, $isFullyPaid";
  }
}
