import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wawamentor/bloc/auth_bloc.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';
import 'package:wawamentor/urls.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //este codigo permite escuchar siempre al authbloc
    //si se quiere actualizar algun componenete es mejor utilizar BlocBuilder
    //final authState = context.watch<AuthBloc>().state as AuthSucces;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/LoginPage');
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is AuthSucces) {
          final datosUsuario = state.userData;
          final cursos = state.cursos;
          final niveles = state.niveles;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Inicio',
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
            drawer: Drawer(
              backgroundColor: Colors.grey[100],
              child: Column(
                children: [
                  DrawerHeader(
                    child: CircleAvatar(
                      radius: 100, // Image radius
                      backgroundImage: const AssetImage('lib/assets/user.png'),
                      foregroundImage: NetworkImage(
                          '$imageUserPath${datosUsuario.userPhoto}'),
                    ),
                  ),
                  Text(
                      'Hola ${'${(state).userData.firstName} ${state.userData.lastName}'}'),

                  // Homepage List title
                  ListTile(
                    leading: const Icon(Icons.face),
                    title: const Text('Perfil de Usuario'),
                    onTap: () {
                      // pop the drawer ir al perfil de usuario
                      // Navigator.pop(context);
                      // Navigator.pushNamed(context, '/homepage');
                    },
                  ),

                  //setting page list tile
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Salir de WawaMentor'),
                    onTap: () {
                      // pop the drawer
                      Navigator.pop(context);
                      //context.read es un ontime event
                      context.read<AuthBloc>().add(AuthLogOutRequested());
                    },
                  )
                ],
              ),
            ),

            /// PARA CURSOS DINAMICOS UTILIZAR ListView.Builder
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'MIS CURSOS',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 17, 68, 145)),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: cursos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                                '$imageCursoPath${cursos[index].courseImg}'),
                            Text(
                              cursos[index].courseName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 19.0),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 17, 68, 145),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                niveles[index].courseLevel,
                                style: const TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                MyButton(
                  onPressed: () {
                    // Acción al presionar el botón
                    //Navigator.pop(context);
                    Navigator.pushNamed(context, '/MetronomoPage');
                  },
                  text: 'Metrónomo',
                ),
                const SizedBox(height: 25),
              ],
            ),
          );
        }
        return const Center();
      },
    );
  }
}
