import 'package:coffee_card/models/payment_banks.dart';
import 'package:coffee_card/models/payment_info.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentService {
  final String apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:8000';

  Future<Map<String, dynamic>> getTopUpOptions() async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/payments/top-up-options'),
      headers: {'Content-Type': 'application/json'}
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> getTransactions() async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/payments/transactions'),
      headers: {'Content-Type': 'application/json'}
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<PaymentInfo> getPaymentInfo() async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/payments/info'),
      headers: {'Content-Type': 'application/json'}
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return PaymentInfo.fromJson(data);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<List<PaymentBank>> getBanks() async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/payments/banks'),
      headers: {'Content-Type': 'application/json'}
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((bank) => PaymentBank.fromJson(bank)).toList();
    } else {
      throw Exception('Failed to fetch banks');
    }
  }
}
