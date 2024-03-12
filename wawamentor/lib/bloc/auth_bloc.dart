import 'package:flutter/foundation.dart'; //foundation esta presente por que existe un @inmutable
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wawamentor/data/repository/login_curso_estudiante_repository.dart';
import 'package:wawamentor/models/cursos_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginCursoEstudianteRepository loginCursoEstudianteRepository;
  //constructor de BLOC
  AuthBloc(this.loginCursoEstudianteRepository) : super(AuthInitial()) {
    on<AuthloginRequested>(_getCursoEstudiante);

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

  void _getCursoEstudiante(
    AuthloginRequested event,
    Emitter<AuthState> emit,
  ) async {
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
        if (rol == 'Estudiante') {
          final cursos = await loginCursoEstudianteRepository
              .getCursosEstudiante(email, password);
          emit(AuthSucces(cursos: cursos));
        } else if (rol == 'Maestro') {
          emit(AuthFailure('Maestro no implementado'));
        } else {
          emit(AuthFailure('Administrador no implementado'));
        }
      }
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }
}
