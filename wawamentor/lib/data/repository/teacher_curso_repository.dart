import 'dart:convert';

import 'package:wawamentor/data/data_provider/teacher_curso_data_provider.dart';
import 'package:wawamentor/models/teacher_model.dart';

class TeacherCursoRepository {
  final TeacherCursoDataProvider teacherCursoDataProvider;

  TeacherCursoRepository(this.teacherCursoDataProvider);
  Future<TeacherModel> getInfoTeacherRepository(
      String idTeacher, String api) async {
    try {
      final infoTeacher = await teacherCursoDataProvider
          .getInfoTeacherDataProvider(idTeacher, api);
      final infoTeacherDecode = jsonDecode(infoTeacher);
      return TeacherModel.fromMap(infoTeacherDecode);
    } catch (e) {
      throw e.toString();
    }
  }
}
