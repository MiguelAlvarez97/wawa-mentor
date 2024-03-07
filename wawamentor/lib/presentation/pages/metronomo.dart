import 'package:flutter/material.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';
import 'package:audioplayers/audioplayers.dart';

class MetronomoPage extends StatefulWidget {
  const MetronomoPage({super.key});

  @override
  MetronomePageState createState() => MetronomePageState();
}

class MetronomePageState extends State<MetronomoPage> {
  bool _isPlaying = false;
  double _bpm = 120;

  @override
  void initState() {
    super.initState();
  }

  void _toggleMetronome() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _startMetronome();
      } else {
        _stopMetronome();
      }
    });
  }

  void _startMetronome() async {
    AudioCache.instance = AudioCache(prefix: '');

    while (_isPlaying) {
      final player = AudioPlayer();
      await player.play(AssetSource('lib/assets/sounds/tick.mp3'));
      await Future.delayed(Duration(milliseconds: (60000 / _bpm).round()));
      //print('bpm es igual a $_bpm  , calculo de duration $duracion');
      //await player.dispose();
    }

    setState(() {});
  }

  void _stopMetronome() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Metrónomo',
          style: TextStyle(color: Colors.grey[200]),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 68, 145),
        iconTheme: IconThemeData(color: Colors.grey[200]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'BPM: ${_bpm.round()}',
              style: const TextStyle(fontSize: 20),
            ),
            Slider(
              value: _bpm,
              min: 40,
              max: 360,
              divisions: 20,
              onChanged: (value) {
                setState(() {
                  _bpm = value;
                });
              },
            ),
            const SizedBox(height: 20),
            MyButton(
              onPressed: _toggleMetronome,
              text: _isPlaying ? 'Stop' : 'Start',
            )
          ],
        ),
      ),
    );
  }
}
