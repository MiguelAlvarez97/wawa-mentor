import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wawamentor/bloc/auth_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
        if (state is AuthCurso) {
          YoutubePlayerController? controller;

          final dataDelCurso = state.curso;
          final leccionesLista = state.lecciones;
          final infoMaestro = state.teacherCurso;
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
                return PopScope(
                  canPop: true,
                  onPopInvoked: (didPop) {
                    //llamar a mi lógica bloc para retornar a authsuccess!!
                    context.read<AuthBloc>().add(PopHome(
                        cursos: state.cursos,
                        niveles: state.niveles,
                        userData: state.userData));
                  },
                  child: Scaffold(
                    appBar: AppBar(
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
                    // body: ListView(
                    //   children: [
                    //     Text(dataDelCurso.courseName),
                    //     player,
                    //     Text(dataDelCurso.courseDesc.toString()),
                    //   ],
                    // ),
                    body: SingleChildScrollView(
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
                          Text(dataDelCurso.courseDesc.toString()),
                          Text(dataDelCurso.courseLink),
                          Text(dataDelCurso.daySchedule),
                          Text(dataDelCurso.endSchedule),
                          Text(dataDelCurso.startSchedule),
                          Text(dataDelCurso.startDate),
                          Text(dataDelCurso.endDate),
                        ],
                      ),
                    ),
                  ),
                );
              });
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 17, 68, 145),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
