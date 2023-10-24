import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MainController {
  Dio dio = Dio();
  List<String> facts = [];

  Future<List<String>?> fetchCats() async {
    try {
      final response = await Dio().get('https://catfact.ninja/facts');
      if (response.statusCode == 200) {
        final data = response.data['data'];
        return facts = List<String>.from(data.map((fact) => fact['fact'] as String));
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) print('Error: $error');
    }
    return null;
  }
}
