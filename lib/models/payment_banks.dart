class PaymentBank {
  final String name, image;

  PaymentBank({required this.image, required this.name});

  // Factory constructor or other methods to create this object
  factory PaymentBank.fromJson(Map<String, dynamic> json) {
    return PaymentBank(
      image: json['image'],
      name: json['name'],
    );
  }
}