part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthloginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthloginRequested({required this.email, required this.password});
}

final class AuthLogOutRequested extends AuthEvent {}
