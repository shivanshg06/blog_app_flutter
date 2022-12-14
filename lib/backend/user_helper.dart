import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class UserHelper {
  String baseUrl = 'http://localhost:8000/api/user/';
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
      log('${response.body} . ${response.statusCode}');
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        return [data['token'], response.statusCode];
      }
      var error = jsonDecode(response.body);
      return [error['message'], response.statusCode];
    } catch (e) {
      log('Error:: $e');
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
      log('${response.body} . ${response.statusCode}');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return [data['token'], response.statusCode];
      }
      var error = jsonDecode(response.body);
      return [error['message'], response.statusCode];
    } catch (e) {
      log('Error:: $e');
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
      var response = await http.put(
        Uri.parse('${baseUrl}setSecurity/'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken'
        },
        body: {
          'security-question': question,
          'security-answer': answer,
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return Future.error('Server Error\n${response.body}');
    } catch (e) {
      log('$e');
      return e;
    }
  }

  Future getUser(String userToken) async {
    try {
      var response = await http.get(
        Uri.parse('${baseUrl}returnUser'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken'
        },
      );
      log('${response.body} . ${response.statusCode}');
      if (response.statusCode == 200) {
        log('${jsonDecode(response.body)}');
        return jsonDecode(response.body);
      }
    } catch (e) {
      log('$e');
      return e;
    }
  }

  Future resetPassword(String userToken, String oldPass, String newPass) async {
    try {
      var response =
          await http.put(Uri.parse('${baseUrl}resetPassword'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken'
      }, body: {
        'old-password': oldPass,
        'password': newPass,
        'password_confirmation': newPass,
      });
      log('${response.body} ${response.statusCode}');
      var data = jsonDecode(response.body);
      log('Data => $data');
      if (response.statusCode == 200) {
        return [data['message'], response.statusCode];
      }
      return [data['message'], response.statusCode];
    } catch (e) {
      log('$e');
      return e;
    }
  }
}
