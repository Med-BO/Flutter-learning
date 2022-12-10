import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

playNote(int noteNumber) async {
  final player = AudioPlayer();
  await player.play(AssetSource('assets_note$noteNumber.wav'));
}

Widget createXylophoneKeyWidget({int noteNumber = 1, int colorShade = 400}) {
  return Expanded(
    child: TextButton(
      style: const ButtonStyle(enableFeedback: false),
      onPressed: () {
        playNote(noteNumber);
      },
      child: Container(
        color: Colors.blue[colorShade],
      ),
    ),
  );
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [
            createXylophoneKeyWidget(noteNumber: 1, colorShade: 300),
            createXylophoneKeyWidget(noteNumber: 2, colorShade: 400),
            createXylophoneKeyWidget(noteNumber: 3, colorShade: 500),
            createXylophoneKeyWidget(noteNumber: 4, colorShade: 600),
            createXylophoneKeyWidget(noteNumber: 5, colorShade: 700),
            createXylophoneKeyWidget(noteNumber: 6, colorShade: 800),
            createXylophoneKeyWidget(noteNumber: 7, colorShade: 900),
          ]),
        ),
      ),
    );
  }
}
