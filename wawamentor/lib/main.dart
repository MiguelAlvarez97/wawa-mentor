import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wawamentor/app_bloc_observer.dart';
import 'package:wawamentor/bloc/auth_bloc.dart';
import 'package:wawamentor/data/data_provider/login_cursos_estudiante_provider.dart';
import 'package:wawamentor/data/data_provider/login_user_data_provider.dart';
import 'package:wawamentor/data/data_provider/nivel_cursos_data_provider.dart';
import 'package:wawamentor/data/repository/login_curso_estudiante_repository.dart';
import 'package:wawamentor/data/repository/login_user_data_repository.dart';
import 'package:wawamentor/data/repository/nivel_cursos_repository.dart';
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
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(
            context.read<LoginCursoEstudianteRepository>(),
            context.read<LoginUserDataRepository>(),
            context.read<NivelCursosRepository>()),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'WawaMentor',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 17, 68, 145)),
              //useMaterial3: true,
            ),
            home: const LoginPage(),
            routes: {
              '/LoginPage': (context) => const LoginPage(),
              '/HomePage': (context) => const HomePage(),
              '/MetronomoPage': (context) => const MetronomoPage(),
              '/CursosPage': (context) => CourseDetailsPage(),
              '/HomeAdmin': (context) => HomeAdmin(),
            }),
      ),
    );
  }
}
