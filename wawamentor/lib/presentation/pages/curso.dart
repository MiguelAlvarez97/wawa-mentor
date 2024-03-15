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
    // _controller = YoutubePlayerController(
    //     initialVideoId: ytUrl,
    //     flags: const YoutubePlayerFlags(
    //       autoPlay: true,
    //       mute: false,
    //       isLive: false,
    //     ));
  }

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
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
                autoPlay: true,
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
                      body: Column(
                        children: [
                          player,
                        ],
                      )),
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
