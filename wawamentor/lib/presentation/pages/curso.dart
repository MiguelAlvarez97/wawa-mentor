import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wawamentor/bloc/auth_bloc.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthCurso) {
          final dataDelCurso = state.curso;
          final leccionesLista = state.lecciones;
          final infoMaestro = state.teacherCurso;
          return PopScope(
            canPop: true,
            onPopInvoked: (didPop) {
              //llamar a mi lógica bloc para retornar a authsuccess!!
              context.read<AuthBloc>().add(PopHome(
                  cursos: state.cursos,
                  niveles: state.niveles,
                  userData: state.userData));
            },
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Curso',
                    style: TextStyle(color: Colors.grey[200]),
                  ),
                  iconTheme: IconThemeData(color: Colors.grey[200]),
                  backgroundColor: const Color.fromARGB(255, 17, 68, 145),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications),
                      color: Colors.grey[200],
                    )
                  ],
                ),
                body: const Center(child: Icon(Icons.network_cell))),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 17, 68, 145),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
