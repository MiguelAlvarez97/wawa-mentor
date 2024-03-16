import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wawamentor/bloc/auth_bloc.dart';

class Actividades extends StatefulWidget {
  const Actividades({super.key});

  @override
  State<Actividades> createState() => _ActividadesState();
}

class _ActividadesState extends State<Actividades> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is AuthLesson) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(PopCurso(
                      curso: state.curso,
                      teacherCurso: state.teacherCurso,
                      lecciones: state.lecciones,
                      cursos: state.cursos,
                      userData: state.userData,
                      niveles: state.niveles));
                  Navigator.popAndPushNamed(context, '/CursoPage');
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              title: Text(
                'Actividad ${state.tituloLeccion}',
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
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 17, 68, 145),
          ),
          body: const Text('ESTAS EN ACTIVIDADES'),
        );
      },
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
    );
  }
}
