import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wawamentor/bloc/auth_bloc.dart';
import 'package:wawamentor/data/data_provider/login_cursos_estudiante_provider.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';
import 'package:wawamentor/presentation/widgets/my_textfield.dart';
import 'package:wawamentor/presentation/widgets/square_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final List<String> roles = <String>['Estudiante', 'Maestro', 'Administrador'];

  String dropdownValue = 'Estudiante';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 17, 68, 145),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
            if (state is AuthSucces) {
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (context) => const HomePage()),
              //     (route) => false);

              Navigator.pop(context);
              Navigator.pushNamed(context, '/HomePage');
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return SingleChildScrollView(
                child: Center(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 85),
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
                  imagePath: 'lib/assets/logo.png',
                  size: 100,
                ),

                const SizedBox(height: 20),
                // Seleccionar Perfil

                // or login with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                Container(
                  width: 225,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      border: InputBorder.none, // Eliminar el borde del input
                      contentPadding:
                          EdgeInsets.zero, // Ajustar el relleno del contenido
                    ),
                    dropdownColor: Colors.grey.shade200,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: roles.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: dropdownValue,
                  ),
                ),

                const SizedBox(height: 15),
                //User name
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
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
                  onPressed: () {
                    // aqui llamo a mi evento bloc authloginRequest
                    context.read<AuthBloc>().add(AuthloginRequested(
                          rol: dropdownValue,
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ));
                  },
                  text: 'Iniciar Sesión',
                ),

                const SizedBox(height: 15),
                //Registrarse
              ],
            )));
          },
        ));
  }
}
