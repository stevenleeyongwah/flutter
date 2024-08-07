import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  final String apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:8000';

  Future<Map<String, dynamic>> login(String email, String password) async {
    print('$apiUrl/api/users/login');
    final response = await http.post(
      Uri.parse('$apiUrl/api/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    print('Response Body: ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }
}
