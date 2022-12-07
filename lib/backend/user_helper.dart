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
          "security-question": '',
          "security-answer": '',
        },
      );
      log(response.body);
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        log('${data['token']}');
        return data['token'];
      }
      log(response.body);
      return Future.error('Server Error\n${response.body}');
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
      log(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        log('${data['token']}');
        return data['token'];
      }
      return Future.error('Server Error\n${response.body}');
    } catch (e) {
      log('$e');
      return e;
    }
  }

  Future getId(String userToken) async {
    try {
      var response = await http.get(
        Uri.parse('${baseUrl}userId'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken'
        },
      );
      log(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
      return Future.error('Server Error\n${response.body}');
    } catch (e) {
      log('$e');
      return e;
    }
  }

  Future logout(String userToken) async {
    try {
      var response = await http.post(
        Uri.parse('${baseUrl}logout'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken'
        },
      );
      log(response.body);
      if (response.statusCode == 200) {
        return;
      }
      return Future.error('Server Error\n${response.body}');
    } catch (e) {
      log('$e');
      return e;
    }
  }

  Future setSecurity(String userToken, String question, String answer) async {
    try {
      var response =
          await http.put(Uri.parse('${baseUrl}setSecurity/'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken'
      }, body: {
        'security-question': question,
        'security-answer': answer,
      });
      log(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
      return Future.error('Server Error\n${response.body}');
    } catch (e) {
      log('$e');
      return e;
    }
  }
}
