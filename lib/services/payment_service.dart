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
    print("response: ${response.body}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }
}
