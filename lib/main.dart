import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemNavigator, rootBundle;
import 'package:json_theme/json_theme.dart';
import 'dart:convert';

//imports that connet to the other dart files in the lib folder
import 'package:mem_match_game/matchGame.dart';
import 'package:mem_match_game/progress.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(MyApp(theme: theme));
}

//builds home screen
class MyApp extends StatelessWidget {
  final ThemeData theme;

  const MyApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Memory & Matching Game',
            textAlign: TextAlign.center,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            //background image
            Positioned.fill(
                child: Image.asset(
              'assets/images/home_background.png',
              fit: BoxFit.cover,
            )),
            //play button
            Center(
              child: Builder(
                builder: (BuildContext context) {
                  return TextButton(
                    onPressed: () {
                      // Opens Matching Game screen when play button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MatchGame(theme: theme),
                        ),
                      );
                    },
                    child: const Image(
                      image: AssetImage('assets/images/play_button.png'),
                      width: 200,
                      height: 200,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        // builds navigation bar at the bottom of the screen
        bottomNavigationBar: Builder(
          builder: (BuildContext context) {
            return BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.addchart),
                  label: 'Progress',
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
                    // Progress button pressed - opens progress page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProgressPage(theme: theme)));
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
      ),
    );
  }
}
