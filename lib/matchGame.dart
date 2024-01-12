// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mem_match_game/main.dart';

class MatchGame extends StatelessWidget {
  final ThemeData theme;

  const MatchGame({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header bar
      appBar: AppBar(
        title: const Text('Where do you want to play?'),
      ),
      // scenece picker buttons
      body: Center(
        child: Container(
          color: Colors.yellow[100],
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // TODO: Navigate to scene 1
                },
                child: const Image(
                  image: AssetImage('assets/images/farm_scene_picker.jpg'),
                  width: 250,
                  height: 450,
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to scene 2
                },
                child: const Image(
                  image: AssetImage('assets/images/beach_scene_picker.jpg'),
                  width: 250,
                  height: 450,
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to scene 3
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
      // bottom navigation bar
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
              // Handles navigation to different pages using a switch statement
              switch (index) {
                case 0:
                  // Back button pressed - returns to home screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyApp(theme: theme)));
                  break;
                case 1:
                  // Exit button pressed - closes app
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
