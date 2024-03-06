import 'package:flutter/material.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';
import 'package:wawamentor/presentation/widgets/square_tile.dart';

class HomeAdmin extends StatelessWidget {
  HomeAdmin({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 17, 68, 145),
        body: SafeArea(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            // Logo WayraWawa
            const SquareTile(
              imagePath: 'lib/assets/logo.png',
              size: 100,
            ),

            const SizedBox(height: 20),
            //Welcome
            Text(
              'Bienvenido Administrador',
              style: TextStyle(
                color: Colors.grey[200],
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),

            // Seleccionar Perfil
            //
            const SizedBox(height: 15),
            MyButton(
              onPressed: () {},
              text: 'Perfil Administrador',
            ),
            const SizedBox(height: 15),
            //Registrarse
            MyButton(
              onPressed: () {},
              text: 'Gestión de Administradores',
            ),

            const SizedBox(height: 15),
            MyButton(
              onPressed: () {},
              text: 'Gestión Cursos',
            ),

            const SizedBox(height: 15),
            MyButton(
              onPressed: () {},
              text: 'Gestión de Usuarios Estudiantes',
            ),

            const SizedBox(height: 15),
            MyButton(
              onPressed: () {},
              text: 'Gestión de Usuarios Maestros',
            ),

            const SizedBox(height: 15),
          ],
        ))));
  }
}
