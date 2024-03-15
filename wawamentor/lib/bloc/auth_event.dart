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

final class AuthLogOutRequested extends AuthEvent {}

final class PopHome extends AuthEvent {
  final List<CursosModel> cursos;
  final UserModel userData;
  final List<NivelModel> niveles;

  PopHome(
      {required this.cursos, required this.userData, required this.niveles});
}
