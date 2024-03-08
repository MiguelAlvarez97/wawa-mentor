import 'package:flutter/foundation.dart'; //foundation esta presente por que existe un @inmutable
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //constructor de BLOC
  AuthBloc() : super(AuthInitial()) {
    on<AuthloginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final rol = event.rol;
        final email = event.email;
        final password = event.password;
        final validacionEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        //validación de email
        if (!validacionEmail.hasMatch(email)) {
          return emit(AuthFailure('El email ingresado es incorrecto'));
        } else {
          //logica de la API de validacion aquí
          if (password.length < 6) {
            return emit(AuthFailure('Contraseña Incorrecta'));
          }
          await Future.delayed(const Duration(seconds: 1), () {
            return emit(AuthSucces(uid: email + rol));
          });
        }
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });

    on<AuthLogOutRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(const Duration(seconds: 1), () {
          return emit(AuthInitial());
        });
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
