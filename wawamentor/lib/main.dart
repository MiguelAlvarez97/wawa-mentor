import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wawamentor/bloc/auth_bloc.dart';
import 'package:wawamentor/presentation/pages/curso.dart';
import 'package:wawamentor/presentation/pages/home_page.dart';
import 'package:wawamentor/presentation/pages/login_page.dart';
import 'package:wawamentor/presentation/pages/metronomo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WawaMentor',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 17, 68, 145)),
            //useMaterial3: true,
          ),
          home: const MetronomoPage(),
          routes: {
            '/LoginPage': (context) => LoginPage(),
            '/HomePage': (context) => const HomePage(),
            '/MetronomoPage': (context) => const MetronomoPage(),
            '/CursosPage': (context) => CourseDetailsPage(),
          }),
    );
  }
}
