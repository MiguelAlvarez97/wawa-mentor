import 'package:flutter/material.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WawaMentor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 17, 68, 145)),
        //useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardar Cambios'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(height: 390),
          ),
          MyButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Cambios sin Guardar"),
                    content:
                        const Text("¿Estás seguro de salir sin guardar los datos?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Acción cuando se presiona Cancelar
                          Navigator.of(context).pop();
                        },
                        child: const Text("Regresar"),
                      ),
                      TextButton(
                        onPressed: () {
                          // Acción cuando se presiona Aceptar
                          // Aquí puedes añadir la lógica para guardar
                          Navigator.of(context).pop();
                        },
                        child: const Text("Salir"),
                      ),
                    ],
                  );
                },
              );
            },
            //child: Text('Guardar'),
            text: 'Guardar',
          ),
        ],
      ),
    );
  }
}
