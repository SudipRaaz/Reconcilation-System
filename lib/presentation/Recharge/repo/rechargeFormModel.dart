class RechargeFormModel {
  String operatorName;
  String amount;
  String receiverMobileNumber;
  String? individualRemarks;
  List<String?> additionalParameters;

  RechargeFormModel({
    required this.operatorName,
    required this.amount,
    required this.receiverMobileNumber,
    this.individualRemarks,
    this.additionalParameters = const [],
  });

  // Factory constructor to create an instance from a map (if needed)
  factory RechargeFormModel.fromMap(Map<String, dynamic> map) {
    return RechargeFormModel(
      operatorName: map['operatorName'],
      amount: map['amount'],
      receiverMobileNumber: map['receiverMobileNumber'],
      individualRemarks: map['individualRemarks'],
      additionalParameters: List<String?>.from(map['additionalParameters']),
    );
  }

  // Convert the instance to a map (if needed)
  Map<String, dynamic> toMap() {
    return {
      'operatorName': operatorName,
      'amount': amount,
      'receiverMobileNumber': receiverMobileNumber,
      'individualRemarks': individualRemarks,
      'additionalParameters': additionalParameters,
    };
  }

  // Convert the instance to a CSV row
  List<String> toCsvRow() {
    return [
      operatorName,
      amount,
      receiverMobileNumber,
      individualRemarks ?? '',
      ...additionalParameters.map((param) => param ?? ''),
    ];
  }
}
