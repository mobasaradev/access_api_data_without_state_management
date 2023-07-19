import 'dart:convert';
import 'package:access_api/models/photo.dart';
import 'package:access_api/services/api_service.dart';

class ProductsRepo {
  ProductsRepo({required this.apiService});

  final ApiService apiService;

  Future<List<Photo>> getProducts() async {
    final response = await apiService.fetchPhoto();
    final responseBody = await response?.stream.bytesToString();
    return _parseProducts(responseBody);
  }

  List<Photo> _parseProducts(String? responseBody) {
    if (responseBody != null) {
      final json = jsonDecode(responseBody) as List<dynamic>;
      final photos = [
        for (final photoJson in json) Photo.fromJson(photoJson)
      ];
      return photos;
    }
    return [];
  }
}
