import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void play(int sound) {
    final player = new AudioCache();
    player.play('note$sound.wav');
  }

  Expanded buildKey(int sound, color) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          play(sound);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1, Colors.red[400]),
              buildKey(2, Colors.orange[400]),
              buildKey(3, Colors.yellow[400]),
              buildKey(4, Colors.green[400]),
              buildKey(5, Colors.green[800]),
              buildKey(6, Colors.blue[400]),
              buildKey(7, Colors.purple[400]),
            ],
          ),
        ),
      ),
    );
  }
}
