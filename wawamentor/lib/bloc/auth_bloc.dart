import 'package:flutter/foundation.dart'; //foundation esta presente por que existe un @inmutable
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wawamentor/data/repository/lesson_curso_repository.dart';
import 'package:wawamentor/data/repository/login_curso_estudiante_repository.dart';
import 'package:wawamentor/data/repository/login_user_data_repository.dart';
import 'package:wawamentor/data/repository/nivel_cursos_repository.dart';
import 'package:wawamentor/data/repository/resource_repository.dart';
import 'package:wawamentor/data/repository/teacher_curso_repository.dart';
import 'package:wawamentor/models/cursos_model.dart';
import 'package:wawamentor/models/lesson_model.dart';
import 'package:wawamentor/models/nivel_model.dart';
import 'package:wawamentor/models/resource_model.dart';
import 'package:wawamentor/models/teacher_model.dart';
import 'package:wawamentor/models/user_wm_model.dart';
import 'package:wawamentor/urls.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginCursoEstudianteRepository loginCursoEstudianteRepository;
  final LoginUserDataRepository loginUserDataRepository;
  final NivelCursosRepository nivelCursosRepository;
  final LessonCursoRepository lessonCursoRepository;
  final TeacherCursoRepository teacherCursoRepository;
  final ResourceRepository resourceRepository;
  //constructor de BLOC
  AuthBloc(
    this.loginCursoEstudianteRepository,
    this.loginUserDataRepository,
    this.nivelCursosRepository,
    this.lessonCursoRepository,
    this.teacherCursoRepository,
    this.resourceRepository,
  ) : super(AuthInitial()) {
    on<AuthloginRequested>(_getCursoEstudiante);

    on<InfoCursoRequested>(_infoCourse);

    on<InfoLessonRequested>(_infoLesson);

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

    on<PopHome>((PopHome event, emit) {
      try {
        final cursos = event.cursos;
        final userData = event.userData;
        final niveles = event.niveles;
        emit(AuthSucces(cursos: cursos, userData: userData, niveles: niveles));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<PopCurso>((PopCurso event, emit) {
      try {
        emit(AuthCurso(
            curso: event.curso,
            teacherCurso: event.teacherCurso,
            lecciones: event.lecciones,
            cursos: event.cursos,
            userData: event.userData,
            niveles: event.niveles));
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
        emit(AuthFailure('El email ingresado es incorrecto'));
      } else {
        //logica de la API de validacion aquí
        if (rol == 'Estudiante') {
          final cursos = await loginCursoEstudianteRepository
              .getCursosEstudiante(email, password, apiLoginEstudiante);
          final userData = await loginUserDataRepository.getUserData(
              email, password, apiLoginUserData);
          final niveles = await nivelCursosRepository.getNivelCursos(
              email, password, coursesLevelEstudiante);
          emit(
              AuthSucces(cursos: cursos, userData: userData, niveles: niveles));
        } else if (rol == 'Maestro') {
          final cursos = await loginCursoEstudianteRepository
              .getCursosEstudiante(email, password, apiLoginMaestro);
          final userData = await loginUserDataRepository.getUserData(
              email, password, apiLoginUserData);
          final niveles = await nivelCursosRepository.getNivelCursos(
              email, password, coursesLevelMaestro);
          emit(
              AuthSucces(cursos: cursos, userData: userData, niveles: niveles));
        } else {
          //se debe logear con el modelo de administrador
          final adminData = await loginUserDataRepository.getUserData(
              email, password, apiLoginAdmin);
          emit(AuthAdmin(adminData: adminData));
        }
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _infoCourse(
    InfoCursoRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final curso = event.curso;
      final idCurso = event.idCurso;
      final idTeacher = event.idTeacher;
      final cursos = event.cursos;
      final niveles = event.niveles;
      final userData = event.userData;
      final listaLecciones = await lessonCursoRepository.getLessonsOfCourse(
          idCurso, apiConsultarLeccionesCurso);
      final datosMaestroCurso = await teacherCursoRepository
          .getInfoTeacherRepository(idTeacher, apiConsultarInfoTeacher);
      emit(AuthCurso(
          curso: curso,
          teacherCurso: datosMaestroCurso,
          lecciones: listaLecciones,
          userData: userData,
          niveles: niveles,
          cursos: cursos));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _infoLesson(InfoLessonRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final curso = event.curso;
      final teacherCurso = event.teacherCurso;
      final lecciones = event.lecciones;
      final cursos = event.cursos;
      final userData = event.userData;
      final niveles = event.niveles;
      final idlesson = event.idLesson;
      final nombreLeccion = event.nombreLeccion;
      final listaRecursos = await resourceRepository.getResourceModelRepository(
          idlesson, apiConsultarRecursosLeccion);

      emit(AuthLesson(
          curso: curso,
          teacherCurso: teacherCurso,
          lecciones: lecciones,
          cursos: cursos,
          userData: userData,
          niveles: niveles,
          recursos: listaRecursos,
          tituloLeccion: nombreLeccion));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
