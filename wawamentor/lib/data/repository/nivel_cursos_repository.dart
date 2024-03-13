import 'dart:convert';

import 'package:wawamentor/data/data_provider/nivel_cursos_data_provider.dart';
import 'package:wawamentor/models/nivel_model.dart';

class NivelCursosRepository {
  final NivelCursosDataProvider nivelCursosDataProvider;

  NivelCursosRepository(this.nivelCursosDataProvider);

  Future<List<NivelModel>> getNivelCursos(
      String username, String password, String apiLogin) async {
    try {
      final dataNiveles = await nivelCursosDataProvider.getNivelCursosData(
          username, password, apiLogin);
      final List<dynamic> nivelesList = jsonDecode(dataNiveles);

      // Mapea cada elemento de la lista a una instancia del modelo de Nivel
      List<NivelModel> niveles =
          nivelesList.map((nivel) => NivelModel.fromMap(nivel)).toList();
      return niveles;
    } catch (e) {
      throw e.toString();
    }
  }
}
