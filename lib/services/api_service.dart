import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country.dart';

class ApiService {
  static const String apiEndpoint = 'https://restcountries.com/v3.1/all';

  static Future<List<Country>> fetchCountries() async {
    final response = await http.get(Uri.parse(apiEndpoint));

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries. Status code: ${response.statusCode}');
    }
  }
}