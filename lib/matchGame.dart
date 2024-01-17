// ignore_for_file: file_names

import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mem_match_game/main.dart';

class MatchGame extends StatelessWidget {
  final ThemeData theme;

  MatchGame({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Where would you like to play?'),
      ),
      body: Center(
        child: Container(
          color: Colors.yellow[100],
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  navigateToGameScreen(
                      context, 'assets/images/scenes/farm_scene.jpg');
                },
                child: const Image(
                  image: AssetImage('assets/images/farm_scene_picker.jpg'),
                  width: 250,
                  height: 450,
                ),
              ),
              TextButton(
                onPressed: () {
                  navigateToGameScreen(
                      context, 'assets/images/scenes/beach_scene.jpg');
                },
                child: const Image(
                  image: AssetImage('assets/images/beach_scene_picker.jpg'),
                  width: 250,
                  height: 450,
                ),
              ),
              TextButton(
                onPressed: () {
                  navigateToGameScreen(
                      context, 'assets/images/scenes/town_scene.jpg');
                },
                child: const Image(
                  image: AssetImage('assets/images/town_scene_picker.jpg'),
                  width: 250,
                  height: 450,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Builder(
        builder: (BuildContext context) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Back to Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: 'Exit',
              ),
            ],
            currentIndex: 0,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(theme: theme),
                    ),
                  );
                  break;
                case 1:
                  SystemNavigator.pop();
                  break;
              }
            },
          );
        },
      ),
    );
  }
}

void navigateToGameScreen(BuildContext context, String selectedScene) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MatchScreen(selectedScene: selectedScene),
    ),
  );
}

class MatchScreen extends StatefulWidget {
  final String selectedScene;

  MatchScreen({Key? key, required this.selectedScene}) : super(key: key);

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  late ThisMatchGame game;

  @override
  void initState() {
    super.initState();
    game = ThisMatchGame(selectedScene: widget.selectedScene);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find the matching object!'),
      ),
      body: Center(
        child: Container(
          color: Colors.yellow[100],
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                // shows object to find and score
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    image: AssetImage(
                        'assets/images/objects/farm/cow.jpg'), // TO DO: amend to take random object from the selected scene
                    width: 100,
                    height: 100,
                  ),
                  Text(
                      'Score: $game.score') //TO DO: show score in a more interesting way
                ],
              ),
              Column(
                  // displays selects scene
                  children: [
                    Text(widget.selectedScene),
                  ]
                  // TO DO: change to selected scene
                  )
            ], // scene and object boxes here
          ),
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
