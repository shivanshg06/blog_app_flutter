import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class BlogHelper {
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
        // log('message');
        log(response.body);
        // log('message');
        return jsonDecode(response.body);
      }
      return Future.error('Server Error');
    } catch (e) {
      log('$e');
      return Future.error(e);
    }
  }

  void destroy(var id) {
    try {
      http.delete(Uri.parse('$baseUrl$id/delete/'));
      log('Delete Successful');
    } catch (e) {
      log('$e');
    }
  }
}
