// ignore_for_file: file_names

import 'dart:math';

import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mem_match_game/main.dart';
import 'package:mem_match_game/matchGame.dart';

class MatchGameScreen extends StatelessWidget {
  final ThemeData theme;
  MatchGame? game;

  MatchGameScreen({Key? key, required this.theme}) : super(key: key);

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
                      context,
                      Image.asset(
                        'assets/images/scenes/farm_scene.jpg',
                        width: 550,
                        height: 350,
                      ));
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
                      context,
                      Image.asset(
                        'assets/images/scenes/beach_scene.jpg',
                        width: 550,
                        height: 350,
                      ));
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
                      context,
                      Image.asset(
                        'assets/images/scenes/town_scene.jpg',
                        width: 550,
                        height: 350,
                      ));
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

void navigateToGameScreen(BuildContext context, Image selectedScene) {
  MatchGame game = MatchGame();

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          MatchScreen(selectedScene: selectedScene, game: game),
    ),
  );
}

class MatchScreen extends StatefulWidget {
  final Image selectedScene;

  MatchScreen({Key? key, required this.selectedScene, required MatchGame game})
      : super(key: key);

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

// object lists for each scene
  List farmObjects = [
    'assets/images/objects/farm/cow.jpg',
    'assets/images/objects/farm/farmDog.jpg',
    'assets/images/objects/farm/pig.jpg',
    'assets/images/objects/farm/farmer.jpg',
    'assets/images/objects/farm/tractor.jpg',
    'assets/images/objects/farm/redBarn.jpg',
  ];

  List townObjects = [
    'assets/images/objects/town/clockTower.jpg',
    'assets/images/objects/town/bus.jpg',
    'assets/images/objects/town/dogWalker.jpg',
    'assets/images/objects/town/policeOfficer.jpg',
    'assets/images/objects/town/shopSign.jpg',
    'assets/images/objects/town/weatherVane.jpg',
  ];

  List beachObjects = [
    'assets/images/objects/beach/beachBall.jpg',
    'assets/images/objects/beach/beachTowel.jpg',
    'assets/images/objects/beach/bucket.jpg',
    'assets/images/objects/beach/sailBoat.jpg',
    'assets/images/objects/beach/seagull.jpg',
    'assets/images/objects/beach/umbrella.jpg',
  ];

// method that selects a random object from the current scene
  selectrdmobject() {
    var rdmIndex = Random().nextInt(6);
    String scenePath = (widget.selectedScene.image as AssetImage).assetName;

    if (scenePath == 'assets/images/scenes/farm_scene.jpg') {
      return farmObjects[rdmIndex];
    } else if (scenePath == 'assets/images/scenes/town_scene.jpg') {
      return townObjects[rdmIndex];
    } else if (scenePath == 'assets/images/scenes/beach_scene.jpg') {
      return beachObjects[rdmIndex];
    } else {
      //handle error - returns app icon
      return 'assests/images/play_button.png';
    }
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    // shows object to find
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        selectrdmobject(),
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                  Column(
                    // displays selects scene
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.selectedScene,
                      Container(
                        constraints:
                            const BoxConstraints(maxWidth: 250, maxHeight: 450),
                      ),
                    ],
                  ),
                ]
                // TO DO: add botton navigation bar (home, exit)
                )
            // scene and object boxes here
            ),
      ),
    );
  }
}

mixin TapDetector {
  void onTap() {
    // TO DO: implement onTap
  }
}

class ThisMatchGame {
  int score = 0;

  List<String> scenes = ['farm_scene.png', 'beach_scene.png', 'town_scene.png'];
  Image selectedScene;

  Image? currentScene;

  ThisMatchGame({required this.selectedScene}) : super() {
    startNewRound();
  }

  void startNewRound() {
    currentScene = selectedScene;
    currentObject = objectToFind();
  }

  // Rest of the code...
  String currentObject = '';

  String objectToFind() {
    // TO DO: Logic to select a random object from the current scen
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
