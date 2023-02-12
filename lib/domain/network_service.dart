import 'dart:convert';
import 'package:http/http.dart';

class NetworkService {
  final baseUrl = "http://sneakers.test/api";

  Future<List<dynamic>> getBrands() async {
    try {
      final response = await get(Uri.parse("$baseUrl/brands"));
      print(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
