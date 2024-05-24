import 'package:http/http.dart' as http;
import 'dart:convert';


class AuthService {

  String urlbase = "http://172.20.10.2:3989";
  Future<bool> login(String email, String password) async {

    var url = Uri.parse("$urlbase/login");
    var response = await http.post(url, body: {
      "email": email,
      "password": password
    });
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(String email, String username, String password) async {
    var url = Uri.parse("http://172.20.10.2:3989/signup");
    print("Attempting to POST to $url");

    var response = await http.post(url, headers: {
      'Content-Type': 'application/json',
    }, body: jsonEncode({
      "email": email,
      "username": username,
      "password": password
    }));

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 201) {
      print("Inscription réussie");
      return true;
    } else {
      print("Échec de l'inscription : ${response.statusCode}");
      return false;
    }
  }



}