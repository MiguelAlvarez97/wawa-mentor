import 'dart:convert';

import 'package:wawamentor/data/data_provider/login_cursos_estudiante_provider.dart';
import 'package:wawamentor/models/cursos_model.dart';

class LoginCursoEstudianteRepository {
  final LoginCursosEstudianteDataProvider loginCursosEstudianteDataProvider;

  LoginCursoEstudianteRepository(this.loginCursosEstudianteDataProvider);

  Future<List<CursosModel>> getCursosEstudiante(
      String username, String password, String apiLogin) async {
    try {
      final cursosEstudiante = await loginCursosEstudianteDataProvider
          .getCursosEstudiante(username, password, apiLogin);
      final List<dynamic> cursosList = jsonDecode(cursosEstudiante);

      // Mapea cada elemento de la lista a una instancia del modelo de Cursos
      List<CursosModel> cursos =
          cursosList.map((curso) => CursosModel.fromMap(curso)).toList();
      cursos.map((e) => print(e.toString()));
      return cursos;
    } catch (e) {
      throw e.toString();
    }
  }
}
