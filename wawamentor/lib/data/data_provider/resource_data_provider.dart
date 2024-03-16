import 'dart:convert';

import 'package:http/http.dart' as http;

class ResourceDataProvider {
  Future<String> getResources(String idLesson, String api) async {
    try {
      final res = await http.get(Uri.parse(api + idLesson));
      if (res.statusCode != 200) {
        return jsonDecode(res.body)['message'];
      } else {
        return res.body;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
