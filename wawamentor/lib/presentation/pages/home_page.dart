import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wawamentor/bloc/auth_bloc.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';
import 'package:wawamentor/presentation/widgets/square_tile.dart';

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
                  //Common to place a drawer header here
                  const DrawerHeader(
                    child:
                        // Icon(
                        //   Icons.face_outlined,
                        //   size: 48,
                        // ),
                        SquareTile(
                      imagePath: 'lib/assets/user.png',
                      size: 40,
                    ),
                  ),
                  Text(
                      'Hola ${'${(state).userData.firstName} ${state.userData.lastName}'}'),

                  // Homepage List title
                  ListTile(
                    leading: const Icon(Icons.face),
                    title: const Text('Perfil de Usuario'),
                    onTap: () {
                      // pop the drawer
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/homepage');
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: <Widget>[
                    Container(),
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
                  ],
                ),
              ),
            ),
            floatingActionButton:
                // FloatingActionButton.large(
                //   onPressed: () {
                //     // Acción al presionar el botón
                //     //Navigator.pop(context);
                //     Navigator.pushNamed(context, '/MetronomoPage');
                //   },
                //   child: const Text('Metrónomo'),
                // ),
                MyButton(
              onPressed: () {
                // Acción al presionar el botón
                //Navigator.pop(context);
                Navigator.pushNamed(context, '/MetronomoPage');
              },
              text: 'Metrónomo',
            ),
          );
        }
        return const Center();
      },
    );
  }
}
