import 'package:flutter/material.dart';
import 'package:wawamentor/presentation/widgets/my_button.dart';
import 'package:audioplayers/audioplayers.dart';

class MetronomoPage extends StatefulWidget {
  const MetronomoPage({super.key});

  @override
  _MetronomePageState createState() => _MetronomePageState();
}

class _MetronomePageState extends State<MetronomoPage> {
  bool _isPlaying = false;
  double _bpm = 120;
  late AudioCache _audioCache;
  final player = AudioPlayer();

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
    //AudioCache.instance = AudioCache(prefix: '');
    //Duration interval = Duration(milliseconds: (60000 / _bpm).round());
    //_audioCache.loop('tick.wav', volume: 0.5);
    //await player.play(AssetSource('lib/assets/sounds/tick.mp3'));
    AudioCache.instance = AudioCache(prefix: '');
    final player = AudioPlayer();
    await player.play(AssetSource('lib/assets/sounds/tick.mp3'));
    setState(() {});
  }

  void _stopMetronome() async {
    //_audioCache.clearCache();
    await player.stop();
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
              max: 240,
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
