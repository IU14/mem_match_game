// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mem_match_game/main.dart';
import 'matchGame.dart';

class MatchGameScreen extends StatelessWidget {
  final ThemeData theme;

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
                        width: 100,
                        height: 100,
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
                        width: 100,
                        height: 100,
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
                        width: 100,
                        height: 100,
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

//method that starts a new game
  void navigateToGameScreen(
    BuildContext context,
    Image scenePath,
  ) {
    // Object lists for each scene
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

    Object selectRandomObject() {
      var rdmIndex = Random().nextInt(6);
      String scenePathName = (scenePath.image as AssetImage).assetName;

      if (scenePathName == 'assets/images/scenes/farm_scene.jpg') {
        return farmObjects[rdmIndex];
      } else if (scenePathName == 'assets/images/scenes/town_scene.jpg') {
        return townObjects[rdmIndex];
      } else if (scenePathName == 'assets/images/scenes/beach_scene.jpg') {
        return beachObjects[rdmIndex];
      } else {
        // handle error - returns app icon
        return 'assets/images/play_button.png';
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MatchGame(
          scenePath,
          Image.asset(selectRandomObject() as String),
          theme,
        ),
      ),
    );
  }
}
