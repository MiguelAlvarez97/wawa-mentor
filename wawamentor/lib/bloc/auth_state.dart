part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSucces extends AuthState {
  final List<CursosModel> cursos;
  final UserModel userData;
  final List<NivelModel> niveles;

  AuthSucces(
      {required this.cursos,
      required this.userData,
      required this.niveles}); //userModel
}

final class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}

final class AuthLoading extends AuthState {}

final class AuthAdmin extends AuthState {
  final UserModel adminData;
  AuthAdmin({required this.adminData});
}

final class AuthCurso extends AuthState {
  final CursosModel curso;
  final TeacherModel teacherCurso;
  final List<LessonModel> lecciones;
  final List<CursosModel> cursos;
  final UserModel userData;
  final List<NivelModel> niveles;
  final UserModel datosMaestro;

  AuthCurso(
      {required this.curso,
      required this.teacherCurso,
      required this.lecciones,
      required this.cursos,
      required this.userData,
      required this.niveles,
      required this.datosMaestro});
}

final class AuthLesson extends AuthState {
  final CursosModel curso;
  final TeacherModel teacherCurso;
  final List<LessonModel> lecciones;
  final List<CursosModel> cursos;
  final UserModel userData;
  final List<NivelModel> niveles;
  final List<ResourceModel> recursos;
  final String tituloLeccion;
  final UserModel datosMaestro;

  AuthLesson(
      {required this.curso,
      required this.teacherCurso,
      required this.lecciones,
      required this.cursos,
      required this.userData,
      required this.niveles,
      required this.recursos,
      required this.tituloLeccion,
      required this.datosMaestro});
}
