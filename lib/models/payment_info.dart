class PaymentInfo {
  final String balance;

  PaymentInfo({required this.balance});

  // Factory constructor or other methods to create this object
  factory PaymentInfo.fromJson(Map<String, dynamic> json) {
    return PaymentInfo(
      balance: json['balance'],
    );
  }
}