import 'package:flutter/material.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';

class EditCourseScreen extends StatefulWidget {
  const EditCourseScreen({super.key});

  @override
  EditCourseScreenState createState() => EditCourseScreenState();
}

class EditCourseScreenState extends State<EditCourseScreen> {
  String _youtubeLink = '';
  String _courseContent = '';
  String _activities = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Actualizar Curso Guitarra',
          style: TextStyle(color: Colors.grey[200]),
        ),
        iconTheme: IconThemeData(color: Colors.grey[200]),
        backgroundColor: const Color.fromARGB(255, 17, 68, 145),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration:
                    const InputDecoration(labelText: 'Ingresar enlace a un video'),
                onChanged: (value) {
                  setState(() {
                    _youtubeLink = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(labelText: 'Contenido del Curso'),
                maxLines: null, // Permite múltiples líneas
                onChanged: (value) {
                  setState(() {
                    _courseContent = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(labelText: 'Actividades'),
                maxLines: null, // Permite múltiples líneas
                onChanged: (value) {
                  setState(() {
                    _activities = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              // ElevatedButton(
              //   onPressed: () {
              //     // Aquí iría la lógica para guardar los cambios
              //     print('Video de YouTube: $_youtubeLink');
              //     print('Contenido del Curso: $_courseContent');
              //     print('Actividades: $_activities');
              //   },
              //   child: Text('Guardar Cambios'),
              // ),
              MyButton(onPressed: () {}, text: 'Guardar Cambios')
            ],
          ),
        ),
      ),
    );
  }
}
