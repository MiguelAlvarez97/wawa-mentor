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

  InfoCursoRequested(
      {required this.curso, required this.idCurso, required this.idTeacher});
}

final class AuthLogOutRequested extends AuthEvent {}
