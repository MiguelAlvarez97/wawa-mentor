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
