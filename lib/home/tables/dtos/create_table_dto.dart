class CreateTableDto {
  String accountable;
  bool isFullyPaid;

  CreateTableDto({
    required this.accountable,
    required this.isFullyPaid,
  });

  Map<String, dynamic> toJson() {
    return {
      "accountable": accountable,
      "isFullyPaid": isFullyPaid,
    };
  }
}
