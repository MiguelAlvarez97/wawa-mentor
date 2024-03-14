import 'dart:convert';
import 'package:http/http.dart' as http;

class TeacherCursoDataProvider {
  Future<String> getInfoTeacherDataProvider(
      String idTeacher, String api) async {
    try {
      final res = await http.get(Uri.parse(api + idTeacher));
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
