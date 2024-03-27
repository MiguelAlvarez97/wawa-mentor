part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthloginRequested extends AuthEvent {
  final String email;
  final String password;
  final String rol;

  AuthloginRequested(
      {required this.email, required this.password, required this.rol});
}

final class InfoCursoRequested extends AuthEvent {
  final CursosModel curso;
  final String idCurso;
  final String idTeacher;
  final List<CursosModel> cursos;
  final UserModel userData;
  final List<NivelModel> niveles;

  InfoCursoRequested(
      {required this.curso,
      required this.idCurso,
      required this.idTeacher,
      required this.cursos,
      required this.userData,
      required this.niveles});
}

final class InfoLessonRequested extends AuthEvent {
  final CursosModel curso;
  final TeacherModel teacherCurso;
  final List<LessonModel> lecciones;
  final List<CursosModel> cursos;
  final UserModel userData;
  final List<NivelModel> niveles;
  final String idLesson;
  final String nombreLeccion;
  final UserModel datosMaestro;

  InfoLessonRequested(
      {required this.curso,
      required this.teacherCurso,
      required this.lecciones,
      required this.cursos,
      required this.userData,
      required this.niveles,
      required this.idLesson,
      required this.nombreLeccion,
      required this.datosMaestro});

  //////////////////////
}

final class AuthLogOutRequested extends AuthEvent {}

final class PopHome extends AuthEvent {
  final List<CursosModel> cursos;
  final UserModel userData;
  final List<NivelModel> niveles;

  PopHome(
      {required this.cursos, required this.userData, required this.niveles});
}

final class PopCurso extends AuthEvent {
  final CursosModel curso;
  final TeacherModel teacherCurso;
  final List<LessonModel> lecciones;
  final List<CursosModel> cursos;
  final UserModel userData;
  final List<NivelModel> niveles;
  final UserModel datosMaestro;

  PopCurso(
      {required this.curso,
      required this.teacherCurso,
      required this.lecciones,
      required this.cursos,
      required this.userData,
      required this.niveles,
      required this.datosMaestro});
}
