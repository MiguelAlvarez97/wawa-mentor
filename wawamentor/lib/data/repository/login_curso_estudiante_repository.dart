import 'dart:convert';

import 'package:wawamentor/data/data_provider/login_cursos_estudiante_provider.dart';
import 'package:wawamentor/models/cursos_model.dart';

class LoginCursoEstudianteRepository {
  final LoginCursosEstudianteDataProvider loginCursosEstudianteDataProvider;

  LoginCursoEstudianteRepository(this.loginCursosEstudianteDataProvider);

  Future<List<CursosModel>> getCursosEstudiante(
      String username, String password) async {
    try {
      final cursosEstudiante = await loginCursosEstudianteDataProvider
          .getCursosEstudiante(username, password);
      final List<dynamic> cursosList = jsonDecode(cursosEstudiante);

      // Verifica si hay algún error en el JSON (si existe una clave 'cod' con valor diferente de '200')
      if (cursosList.isNotEmpty && cursosList[0]['cod'] != '200') {
        throw cursosEstudiante;
      }

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
