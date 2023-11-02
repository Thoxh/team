import 'dart:convert';

import 'entity/registration_entity.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.thoxh.de/items/feedback';
  final String token = 'NZFurx8Z_4OPhK-CFf9jMSgPwMIfoj-F';

  // HTTP GET Methode
  Future<List<RegistrationEntity>> getFeedback() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse['data'];
      return data.map((item) => RegistrationEntity.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load feedback');
    }
  }

  // HTTP POST Methode
  Future<void> postRegistration(RegistrationEntity entity) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(entity.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to post registration ${response.statusCode}}');
    }
  }
}
