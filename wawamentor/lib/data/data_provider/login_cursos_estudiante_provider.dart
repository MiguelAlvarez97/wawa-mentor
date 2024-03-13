import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginCursosEstudianteDataProvider {
  Future<String> getCursosEstudiante(
      String username, String password, String apiLogin) async {
    try {
      final res = await http.post(
        Uri.parse(apiLogin),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      } else {
        return res.body;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
