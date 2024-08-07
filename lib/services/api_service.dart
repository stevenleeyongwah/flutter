import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final String apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:8000'; // Fallback URL

  Future<List<Item>> fetchItems() async {
    print('Starting fetchItems...');
    final response = await http.get(Uri.parse(apiUrl));
    print('Full response: ${response.toString()}');
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Item.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}
