import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Magic 8 ball'),
        ),
        body: MagicBall(),
      ),
    );
  }
}

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballNumber = 1;

  revealAnswer() {
    setState(() {
      ballNumber = Random().nextInt(3) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.lightBlueAccent,
        height: double.infinity,
        child: TextButton(
          onPressed: () {
            revealAnswer();
          },
          child: Image.asset("images/ball$ballNumber.png"),
        ),
      ),
    );
  }
}
