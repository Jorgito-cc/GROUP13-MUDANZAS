import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants.dart';
import '../models/user_model.dart';

class AuthService {
  Future<UserModel?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('${AppConstants.baseUrl}/login/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return UserModel.fromJson(data);
    } else {
      return null;
    }
  }
}
