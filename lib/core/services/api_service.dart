// lib/core/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:milkifoodcomplex/core/constant/api_constants.dart';

class ApiService {
  final String _apiKey =
      'kjdhfpiuhfpwerrf23423498kjshdfkwhedfig12312oweuyrnsdvvb';
  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'x-api-key': _apiKey,
  };
  Future<List<dynamic>> getData(int index) async {
    final response = await http.get(
      Uri.parse('${ApiConstants.getData}/$index'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return data['Data'];
    } else {
      throw Exception('Failed to load data for index $index');
    }
  }

  Future<bool> postData(int index, List<Map<String, dynamic>> payload) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.postData}/$index'),
      headers: _headers,
      body: jsonEncode(payload),
    );

    return response.statusCode == 200 || response.statusCode == 201;
  }

  Future<bool> putData(int index, Map<String, dynamic> payload) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.putData}/$index'),
      headers: _headers,

      body: jsonEncode(payload),
    );

    return response.statusCode == 200;
  }

  Future<bool> deleteData(int index, int id) async {
    final response = await http.delete(
      Uri.parse('${ApiConstants.deleteData}/$index/$id'),
    );

    return response.statusCode == 200;
  }
}
