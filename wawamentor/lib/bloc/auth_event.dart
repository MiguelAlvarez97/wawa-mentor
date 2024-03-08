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

final class AuthLogOutRequested extends AuthEvent {}
