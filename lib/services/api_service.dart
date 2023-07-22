import 'dart:convert';

import 'package:access_api/models/cart.dart';
import 'package:access_api/models/photo.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String photoBaseUrl = 'https://jsonplaceholder.typicode.com';
  String cartBaseUrl = 'https://dummyjson.com';
  Future<List<Photo>> getPhoto() async {
    final url = Uri.parse('$photoBaseUrl/photos');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final photos = jsonDecode(response.body);
      final photo = [for (var photo in photos) Photo.fromJson(photo)];
      return photo;
    } else {
      throw Exception("[FAIL!] Couldn't fetch the products.");
    }
  }

  Future<Cart> getCart() async {
    final url = Uri.parse('$cartBaseUrl/carts');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Cart.fromJson(json);
    } else {
      throw Exception("[FAIL!] Couldn't fetch the products.");
    }
  }
}
