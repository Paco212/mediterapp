import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mediterappli/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = '192.168.11.111:8080';
  final storage = const FlutterSecureStorage();

  Future<User?> signUp(String username, String email, String password) async {
    try {
      final response = await http.post(
        Uri.http(baseUrl, '/api/users/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        await storage.write(key: 'token', value: data['accessToken']);
        return User.fromJson(data);
      } else {
        throw Exception('Failed to sign up');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.http(baseUrl, '/api/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        await storage.write(key: 'token', value: data['accessToken']);
        return User.fromJson(data);
      } else {
        throw Exception('La connexion a échouée');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('current_user');
    await storage.delete(key: 'token');
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  void setCurrentUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'current_user',
      jsonEncode(user.toJson()),
    );
  }

  Future<User> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> currentUser =
        jsonDecode(prefs.getString('current_user')!);

    return User.fromJson(currentUser);
  }
}
