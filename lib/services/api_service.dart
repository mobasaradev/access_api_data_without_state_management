import 'dart:developer' as dev show log;

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  Future<http.Response?> fetchPhoto() async {
    final url = Uri.parse('$baseUrl/photos');
    try {
      final response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      }
    } catch (e) {
      dev.log("[FAIL!] Couldn't fetch the products.", error: e);
    }
    return null;
  }
}
