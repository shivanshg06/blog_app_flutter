import 'dart:convert';
import 'dart:developer';

import 'package:blog_app_flutter/backend/user_helper.dart';
import 'package:http/http.dart' as http;

class BlogHelper {
  UserHelper _userHelper = UserHelper();
  String baseUrl = 'http://127.0.0.1:8000/api/blogs/';
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
        // log(response.body);
        return jsonDecode(response.body);
      }
      return Future.error('Server Error');
    } catch (e) {
      log('$e');
      return Future.error(e);
    }
  }

  Future store(String title, String content, String userToken) async {
    String slug = title.toLowerCase().replaceAll(' ', '-').replaceAll('.', '');
    try {
      var idData = await _userHelper.getId(userToken);
      String id = idData['id'].toString();
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
          'user_id': id,
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
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
