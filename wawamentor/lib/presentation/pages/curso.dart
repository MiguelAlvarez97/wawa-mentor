import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wawamentor/bloc/auth_bloc.dart';
import 'package:wawamentor/urls.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  //YoutubePlayerController? _controller;
  //late final String ytUrl;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is AuthCurso) {
          YoutubePlayerController? controller;

          final dataDelCurso = state.curso;
          final leccionesLista = state.lecciones;
          final infoMaestro = state.teacherCurso;
          final dataMaestro = state.datosMaestro;
          //ytUrl = dataDelCurso.courseVideo.split('=').last;

          controller = YoutubePlayerController(
              initialVideoId: dataDelCurso.courseVideo.split('=').last,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
                isLive: false,
              ));
          return YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: const Color.fromARGB(255, 17, 68, 145),
                progressColors: const ProgressBarColors(
                  playedColor: Color.fromARGB(255, 17, 68, 145),
                  handleColor: Color.fromARGB(255, 17, 68, 145),
                  backgroundColor: Color.fromRGBO(100, 181, 246, 1),
                ),
              ),
              builder: (context, player) {
                return Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      onPressed: () {
                        //llamar a mi lógica bloc para retornar a authsuccess!!
                        context.read<AuthBloc>().add(PopHome(
                            cursos: state.cursos,
                            niveles: state.niveles,
                            userData: state.userData));
                        Navigator.popAndPushNamed(context, '/HomePage');
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    title: Text(
                      'Curso',
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
                  body: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            dataDelCurso.courseName,
                            style: const TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 17, 68, 145)),
                          ),
                          player,
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Maestro:',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
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
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ExpansionTile(
                              leading: CircleAvatar(
                                radius: 30, // Image radius
                                backgroundImage:
                                    const AssetImage('lib/assets/user.png'),
                                foregroundImage: NetworkImage(
                                    '$imageUserPath${dataMaestro.userPhoto.toString()}}'),
                              ),
                              title: Text(infoMaestro.teacherRol),
                              subtitle: Text(
                                  '${dataMaestro.firstName} ${dataMaestro.lastName}'),
                              children: [
                                Text(infoMaestro.teacherAboutMe.toString()),
                                ListTile(
                                  leading:
                                      const FaIcon(FontAwesomeIcons.facebook),
                                  title: Text(infoMaestro.teacherFB.toString()),
                                ),
                                ListTile(
                                  leading:
                                      const FaIcon(FontAwesomeIcons.instagram),
                                  title: Text(infoMaestro.teacherIG.toString()),
                                ),
                                ListTile(
                                  leading:
                                      const FaIcon(FontAwesomeIcons.whatsapp),
                                  title: Text(infoMaestro.teacherWP.toString()),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Descripción del curso',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
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
                          Text(
                            dataDelCurso.courseDesc.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Enlace del curso',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
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
                          ElevatedButton(
                            onPressed: () async {
                              final url =
                                  Uri.parse(dataDelCurso.courseLink.toString());
                              if (!await launchUrl(url)) {
                                throw Exception('No se pudo abrir $url');
                              }
                            },
                            child: Text(dataDelCurso.courseLink.toString()),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Horario del Curso',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
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
                          Text(dataDelCurso.daySchedule),
                          Text(dataDelCurso.startSchedule),
                          Text(dataDelCurso.endSchedule),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Fechas de Inicio y Fin del Curso',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
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
                          Text(dataDelCurso.startDate),
                          Text(dataDelCurso.endDate),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Contenido del curso:',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
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
                          // Expanded(
                          Container(
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue, Colors.green],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8),
                              itemCount: leccionesLista.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 4,
                                  child: ListTile(
                                    title:
                                        Text(leccionesLista[index].lessonTitle),
                                    subtitle: Text(
                                        leccionesLista[index].lessonContent),
                                    onTap: () {
                                      context.read<AuthBloc>().add(
                                          InfoLessonRequested(
                                              curso: dataDelCurso,
                                              idLesson: leccionesLista[index]
                                                  .idLesson
                                                  .toString(),
                                              cursos: state.cursos,
                                              lecciones: leccionesLista,
                                              niveles: state.niveles,
                                              teacherCurso: infoMaestro,
                                              userData: state.userData,
                                              nombreLeccion:
                                                  leccionesLista[index]
                                                      .lessonTitle,
                                              datosMaestro:
                                                  state.datosMaestro));
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          // )
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 17, 68, 145),
            ),
            //body: const Text('ESTAS EN CURSOS'),
          );
        }
      },
      listener: (context, state) {
        if (state is AuthLesson) {
          //navigator lesson;
          Navigator.popAndPushNamed(context, '/Actividades');
        }
      },
    );
  }
}
