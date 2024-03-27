import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
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
          final listaRecursos = state.recursos;

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
                      niveles: state.niveles,
                      datosMaestro: state.datosMaestro));
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
            body: ListView.builder(
                itemCount: listaRecursos.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    surfaceTintColor: Colors.amber,
                    margin: const EdgeInsets.all(10),
                    child: ExpansionTile(
                      title: Text(listaRecursos[index].resourceDesc.toString()),
                      //subtitle: Text(listaRecursos[index].link.toString()),
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final url =
                                Uri.parse(listaRecursos[index].link.toString());
                            if (!await launchUrl(url)) {
                              throw Exception('No se pudo abrir $url');
                            }
                          },
                          child: Text(listaRecursos[index].link.toString()),
                        )
                      ],
                    ),
                  );
                }),
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 17, 68, 145),
          ),
          //body: const Text('ESTAS EN ACTIVIDADES'),
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
