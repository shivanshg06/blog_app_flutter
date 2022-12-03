import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class UserHelper {
  String baseUrl = 'http://127.0.0.1:8000/api/user/';
  Future register(String name, String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse('${baseUrl}register'),
        headers: ({
          'Accept': 'application/json',
        }),
        body: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": password,
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        log('OK');
        return data['token'];
      }
      return Future.error('Server Error');
    } catch (e) {
      log('$e');
      return e;
    }
  }

  Future signin(String email, String password) async {
    try {
      var response = await http.post(Uri.parse('${baseUrl}login'),
          headers: ({
            'Accept': 'application/json',
          }),
          body: {
            "email": email,
            "password": password,
          });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        log('OK');
        return data['token'];
      }
      return Future.error('Server Error');
    } catch (e) {
      log('$e');
      return e;
    }
  }

  Future getId(String userToken) async {
    var response = await http.get(Uri.parse('${baseUrl}userId'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    });
    var data = jsonDecode(response.body);
    return data;
  }
}
