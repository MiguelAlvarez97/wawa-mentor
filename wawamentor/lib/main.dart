import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wawamentor/app_bloc_observer.dart';
import 'package:wawamentor/bloc/auth_bloc.dart';
import 'package:wawamentor/data/data_provider/data_user_wm_data_provider.dart';
import 'package:wawamentor/data/data_provider/lesson_curso_data_provider.dart';
import 'package:wawamentor/data/data_provider/login_cursos_estudiante_provider.dart';
import 'package:wawamentor/data/data_provider/login_user_data_provider.dart';
import 'package:wawamentor/data/data_provider/nivel_cursos_data_provider.dart';
import 'package:wawamentor/data/data_provider/resource_data_provider.dart';
import 'package:wawamentor/data/data_provider/teacher_curso_data_provider.dart';
import 'package:wawamentor/data/repository/data_user_wm_repository.dart';
import 'package:wawamentor/data/repository/lesson_curso_repository.dart';
import 'package:wawamentor/data/repository/login_curso_estudiante_repository.dart';
import 'package:wawamentor/data/repository/login_user_data_repository.dart';
import 'package:wawamentor/data/repository/nivel_cursos_repository.dart';
import 'package:wawamentor/data/repository/resource_repository.dart';
import 'package:wawamentor/data/repository/teacher_curso_repository.dart';
import 'package:wawamentor/presentation/pages/actividades.dart';
import 'package:wawamentor/presentation/pages/curso.dart';
import 'package:wawamentor/presentation/pages/home_admin.dart';
import 'package:wawamentor/presentation/pages/home_page.dart';
import 'package:wawamentor/presentation/pages/login_page.dart';
import 'package:wawamentor/presentation/pages/metronomo.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => LoginCursoEstudianteRepository(
              LoginCursosEstudianteDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => LoginUserDataRepository(LoginUserDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => NivelCursosRepository(NivelCursosDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => LessonCursoRepository(LessonCursoDataProvider()),
        ),
        RepositoryProvider(
          create: (context) =>
              TeacherCursoRepository(TeacherCursoDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => ResourceRepository(ResourceDataProvider()),
        ),
        RepositoryProvider(
            create: (context) => DataUserRepository(UserDataProvider())),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(
          context.read<LoginCursoEstudianteRepository>(),
          context.read<LoginUserDataRepository>(),
          context.read<NivelCursosRepository>(),
          context.read<LessonCursoRepository>(),
          context.read<TeacherCursoRepository>(),
          context.read<ResourceRepository>(),
          context.read<DataUserRepository>(),
        ),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'WawaMentor',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 17, 68, 145)),
              //useMaterial3: true,
            ),
            //home: const HomePage(),
            initialRoute: '/',
            routes: {
              '/': (context) => const LoginPage(),
              '/HomePage': (context) => const HomePage(),
              '/MetronomoPage': (context) => const MetronomoPage(),
              '/CursoPage': (context) => const CourseDetailPage(),
              '/HomeAdmin': (context) => HomeAdmin(),
              '/Actividades': (context) => const Actividades(),
            }),
      ),
    );
  }
}
