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
          final cursosEstudiante = state.cursos;
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
                      foregroundImage:
                          NetworkImage('$imagePath${datosUsuario.userPhoto}'),
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: <Widget>[
                    // Panel de Cursos de Música
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          30, // -30 para tener margen entre los paneles
                      child: Card(
                        elevation: 4,
                        child: Column(
                          children: <Widget>[
                            Image.asset('lib/assets/Solfeo.png'),
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Cursos de Solfeo',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Aprende teoría Musical',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Panel de Actividad
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/CursosPage');
                        },
                        child: Card(
                          elevation: 4,
                          child: Column(
                            children: <Widget>[
                              Image.asset('lib/assets/guitar.png'),
                              const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Curso de Guitarra',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), // -30 para tener margen entre los paneles
                    ),
                    // // Panel de Actividad
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          elevation: 4,
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                  'lib/assets/ActividadesPendientes.png'),
                              const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Actividades Pendientes',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), // -30 para tener margen entre los paneles
                    ),
                    MyButton(
                      onPressed: () {
                        // Acción al presionar el botón
                        //Navigator.pop(context);
                        Navigator.pushNamed(context, '/MetronomoPage');
                      },
                      text: 'Metrónomo',
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center();
      },
    );
  }
}
