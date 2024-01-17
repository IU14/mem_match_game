// ignore_for_file: file_names

import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mem_match_game/main.dart';

class MatchGame extends StatelessWidget {
  final ThemeData theme;

  const MatchGame({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Where would you like to play?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to scene 1
              },
              child: const Text('Scene 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to scene 2
              },
              child: const Text('Scene 2'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to scene 3
              },
              child: const Text('Scene 3'),
            ),
          ],
        ),
      ),
    );
  }
}

mixin TapDetector {
  void onTap() {
    print('Tap detected');
  }
}

class ThisMatchGame {
  int score = 0;

  List<String> scenes = ['farm_scene.png', 'beach_scene.png', 'town_scene.png'];
  String selectedScene;

  String currentScene = '';
  String currentObject = '';

  ThisMatchGame({required this.selectedScene}) : super() {
    startNewRound();
  }

  void startNewRound() {
    currentScene = selectedScene;
    currentObject = objectToFind();
  }

  String objectToFind() {
    return 'object1.png';
  }

  void onTapDown(TapDownInfo details) {
    if (isCorrectTap(details)) {
      score++;
      if (score < 5) {
        startNewRound();
      } else {
        // end game
      }
    }
  }

  bool isCorrectTap(TapDownInfo details) {
    // TO DO: implement logic to determine if tap is correct
    return true;
  }

  void render(Canvas canvas) {
    // TO DO: Implement rendering logic here
  }
}
