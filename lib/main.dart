import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('SAYSON CPE32'),
          backgroundColor: Colors.redAccent,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Gif in the background
          Image.asset('images/roll.webp'),
          // Dice on top of the gif
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 40.0), // Add top and bottom padding to move dice upwards
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      changeDiceFace();
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      changeDiceFace();
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}