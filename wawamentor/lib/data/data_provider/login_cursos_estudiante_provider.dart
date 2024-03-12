import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wawamentor/urls.dart';

class LoginCursosEstudianteDataProvider {
  Future<String> getCursosEstudiante(String username, String password) async {
    try {
      final res = await http.post(
        Uri.parse(apiLoginEstudiante),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );
      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
