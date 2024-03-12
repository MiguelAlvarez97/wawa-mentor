import 'package:flutter/material.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Course {
  final String name;
  final String image;
  final String description;
  final String content;
  final String teacher;

  Course({
    required this.name,
    required this.image,
    required this.description,
    required this.content,
    required this.teacher,
  });
}

class CourseDetailsPage extends StatelessWidget {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'QEAl_SHPfUU', //https://www.youtube.com/watch?v=QEAl_SHPfUU
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  final Course course = Course(
    name: 'Curso de Guitarra',
    image: 'lib/assets/logovideo.png',
    description:
        'En este curso, los estudiantes aprenderán los fundamentos para tocar guitarra. Desde la introducción a la guitarra hasta comprender las partes del instrumento y dominar los acordes básicos, este curso proporcionará una base sólida para aquellos que deseen aventurarse en el mundo de la música con este versátil instrumento.',
    content: 'Contenido del curso de Guitarra',
    teacher: 'Nombre del maestro de Coro',
  );

  CourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Curso',
          style: TextStyle(color: Colors.grey[200]),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 68, 145),
        iconTheme: IconThemeData(color: Colors.grey[200]),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.face),
        //     color: Colors.grey[200],
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 15),
            MyButton(onPressed: () {}, text: 'Tomar Asistencia'),
            const SizedBox(height: 10),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              //videoProgressIndicatorColor: Colors.amber,
              // progressColors: ProgressColors(
              //     playedColor: Colors.amber,
              //     handleColor: Colors.amberAccent,
              // ),
              // onReady () {
              //     _controller.addListener(listener);
              // },
            ),
            const SizedBox(height: 20),
            // Nombre del curso
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                course.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Imagen o video
            // Image.asset(
            //   course.image,
            //   fit: BoxFit.cover,
            // ),
            // Descripción del curso
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                course.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            //Contenido del curso
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                course.content,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 30,
              child: GestureDetector(
                onTap: () {},
                child: const Card(
                  elevation: 4,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '1. Introducción a la guitarra',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ), // -30 para tener margen entre los paneles
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 30,
              child: GestureDetector(
                onTap: () {},
                child: const Card(
                  elevation: 4,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '2. Partes del Instrumento',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ), // -30 para tener margen entre los paneles
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 30,
              child: GestureDetector(
                onTap: () {},
                child: const Card(
                  elevation: 4,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '3. Acordes',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ), // -30 para tener margen entre los paneles
            ),
            // Datos del maestro que imparte el curso
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     'Maestro: ${course.teacher}',
            //     textAlign: TextAlign.center,
            //     style: const TextStyle(
            //       fontSize: 18,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class TarjetaList extends StatelessWidget {
  final List<String> items = [
    'Introducción a la guitarra',
    'Partes del Instrumento',
    'Acordes'
  ];

  TarjetaList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(items[index]),
            onTap: () {
              // Acción al hacer clic en la tarjeta
              // Puedes agregar una acción aquí, por ejemplo, navegar a una nueva pantalla
              // Navigator.push(context, MaterialPageRoute(builder: (context) => DetalleScreen()));
            },
          ),
        );
      },
    );
  }
}
