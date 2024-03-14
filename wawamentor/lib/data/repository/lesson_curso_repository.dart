import 'dart:convert';

import 'package:wawamentor/data/data_provider/lesson_curso_data_provider.dart';
import 'package:wawamentor/models/lesson_model.dart';

class LessonCursoRepository {
  final LessonCursoDataProvider lessonCursoDataProvider;

  LessonCursoRepository(this.lessonCursoDataProvider);

  Future<List<LessonModel>> getLessonsOfCourse(
      String idCurso, String api) async {
    try {
      final lecciones =
          await lessonCursoDataProvider.getLessonCurso(idCurso, api);

      final List<dynamic> listaDecode = jsonDecode(lecciones);
      List<LessonModel> leccionesList =
          listaDecode.map((lesson) => LessonModel.fromMap(lesson)).toList();

      return leccionesList;
    } catch (e) {
      throw e.toString();
    }
  }
}
