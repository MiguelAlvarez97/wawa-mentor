import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wawamentor/bloc/auth_bloc.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';
import 'package:wawamentor/presentation/widgets/my_textfield.dart';
import 'package:wawamentor/presentation/widgets/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

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
                //User name
                Semantics(
                  label: 'email',
                  textField: true,
                  enabled: true,
                  child: MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                ),

                const SizedBox(height: 10),
                // Password
                Semantics(
                  label: 'password',
                  textField: true,
                  enabled: true,
                  child: MyTextField(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    obscureText: true,
                  ),
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
                Semantics(
                  label: 'login',
                  enabled: true,
                  button: true,
                  child: MyButton(
                    onPressed: () {
                      // aqui llamo a mi evento bloc authloginRequest
                      context.read<AuthBloc>().add(AuthloginRequested(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ));
                    },
                    text: 'Iniciar Sesión',
                  ),
                ),
                const SizedBox(height: 15),
                //Registrarse
              ],
            )));
          },
        ));
  }
}
