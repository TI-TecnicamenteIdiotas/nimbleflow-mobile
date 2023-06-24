class UpdateTableDto {
  final String id;
  String? accountable;
  bool? isFullyPaid;

  UpdateTableDto({
    required this.id,
    this.accountable,
    this.isFullyPaid,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "accountable": accountable,
      "isFullyPaid": isFullyPaid,
    };
  }
}
