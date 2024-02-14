import 'package:flutter/material.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';
import 'package:wawamentor/presentation/widgets/my_textfield.dart';
import 'package:wawamentor/presentation/widgets/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
            const SizedBox(height: 20),
            //Welcome
            Text(
              'Bienvenido a WawaMentor',
              style: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            // Logo WayraWawa
            const SquareTile(
              imagePath: 'lib/Logo/logo.png',
              size: 100,
            ),

            const SizedBox(height: 20),
            // Seleccionar Perfil
            //
            const SizedBox(height: 15),
            //User name
            MyTextField(
              controller: usernameController,
              hintText: 'Usuario',
              obscureText: false,
            ),

            const SizedBox(height: 10),
            // Password
            MyTextField(
              controller: passwordController,
              hintText: 'Contraseña',
              obscureText: true,
            ),
            // Forgot password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '¿Olvidó su contraseña?',
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            //sign in button
            MyButton(
              onPressed: () {},
            ),
            const SizedBox(height: 15),
            //Registrarse
          ],
        ))));
  }
}
