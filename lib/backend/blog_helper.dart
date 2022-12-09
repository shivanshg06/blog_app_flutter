import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class BlogHelper {
  String baseUrl = 'http://localhost:8000/api/blogs/';

  Future<List> index() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return Future.error('Server Error');
    } catch (e) {
      log('$e');
      return Future.error(e);
    }
  }

  Future show(var id) async {
    try {
      var response = await http.get(Uri.parse('$baseUrl$id/'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return Future.error('Server Error');
    } catch (e) {
      log('$e');
      return Future.error(e);
    }
  }

  Future getUser(var id) async {
    try {
      var response = await http.get(Uri.parse('$baseUrl$id/'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['user_id'];
      }
      return Future.error('Server Error');
    } catch (e) {
      log('error $e');
      return Future.error(e);
    }
  }

  Future store(String title, String content, String userToken) async {
    String slug = title.toLowerCase().replaceAll(' ', '-').replaceAll('.', '');
    try {
      log('message 2');
      var response = await http.post(
        Uri.parse(baseUrl),
        headers: ({
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        }),
        body: {
          "title": title,
          'slug': slug,
          "content": content,
        },
      );
      log('message 3');
      var data = jsonDecode(response.body);
      log('${response.statusCode}');
      if (response.statusCode == 201) {
        return data;
      }
      return response.body;
    } catch (e) {
      log('$e');
      return Future.error(e);
    }
  }

  Future update(
      String title, String content, String id, String userToken) async {
    try {
      var response = await http.put(
        Uri.parse('$baseUrl$id'),
        headers: ({
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        }),
        body: {
          "title": title,
          "content": content,
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      }
      return response.body;
    } catch (e) {
      return Future.error(e);
    }
  }

  void destroy(var id, String userToken) async {
    try {
      var response = await http.delete(
        Uri.parse('$baseUrl$id'),
        headers: ({
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        }),
      );
      if (response.statusCode == 1) {
        log('Deleted Success');
      }
    } catch (e) {
      log('$e');
    }
  }
}
